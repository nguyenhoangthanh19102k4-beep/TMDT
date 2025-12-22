<?php
include_once "./config/dbconnect.php";
include "./header.php";

// Thống kê tổng số
$customer_count  = $conn->query("SELECT COUNT(customer_id) AS total FROM Customers")->fetch_assoc()['total'];
$category_count  = $conn->query("SELECT COUNT(category_id) AS total FROM categories")->fetch_assoc()['total'];
$product_count   = $conn->query("SELECT COUNT(product_id) AS total FROM products")->fetch_assoc()['total'];
$order_count     = $conn->query("SELECT COUNT(order_id) AS total FROM orders")->fetch_assoc()['total'];

// Thống kê đơn hàng theo trạng thái
$orderStatusCounts = [];
$sql = "SELECT status, COUNT(*) as total FROM orders GROUP BY status";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $orderStatusCounts[$row['status']] = $row['total'];
    }
}

// Doanh thu theo ngày
$revenue_by_date = [];
$sql = "SELECT DATE(created_at) AS order_date, SUM(total) AS revenue
        FROM order_details
        GROUP BY DATE(created_at)
        ORDER BY order_date ASC";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $revenue_by_date[$row['order_date']] = $row['revenue'];
    }
}
?>

<body>
<?php include "./sidebar.php"; ?>
<main style="margin-top: 30px;">
  <div class="container all Content-section">

    <h2 style="text-align:center; font-weight:bold; margin-bottom: 30px;">Thống kê hệ thống</h2>

    <!-- Các ô thống kê -->
    <div class="stats-boxes">
      <div class="stat-box">
        <h4>Tổng số khách hàng</h4>
        <h5><?= $customer_count ?></h5>
      </div>
      
      <div class="stat-box">
        <h4>Tổng số sản phẩm</h4>
        <h5><?= $product_count ?></h5>
      </div>
      <div class="stat-box">
        <h4>Tổng số đơn hàng</h4>
        <h5><?= $order_count ?></h5>
      </div>
    </div>

    <!-- Biểu đồ tròn và biểu đồ cột -->
    <div class="chart-wrapper">
      <div class="chart-container">
        <canvas id="chartCanvas"></canvas>
      </div>
      <div class="bar-chart-container">
        <canvas id="orderStatusChart"></canvas>
      </div>
    </div>

    <!-- Biểu đồ doanh thu -->
    <div class="revenue-chart-container">
      <canvas id="revenueChart"></canvas>
    </div>

  </div>
</main>
<?php include "./footer.php"; ?>

<!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  // Biểu đồ tròn
  const data = {
    labels: ["Khách hàng", "Loại SP", "Sản phẩm", "Đơn hàng"],
    datasets: [{
      label: "Thống kê tổng số",
      data: [<?= $customer_count ?>, <?= $category_count ?>, <?= $product_count ?>, <?= $order_count ?>],
      backgroundColor: ["#36A2EB", "#FFCE56", "#4BC0C0", "#FF6384"],
      hoverOffset: 10
    }]
  };

  const config = {
    type: 'pie',
    data: data,
    options: {
      responsive: true,
      plugins: {
        legend: { position: 'bottom' },
        title: {
          display: true,
          text: 'Thống kê dữ liệu hệ thống'
        }
      }
    }
  };

  window.addEventListener('DOMContentLoaded', () => {
    new Chart(document.getElementById('chartCanvas'), config);
  });

  // Biểu đồ cột
  const orderStatusLabels = <?= json_encode(array_keys($orderStatusCounts)) ?>;
  const orderStatusData = <?= json_encode(array_values($orderStatusCounts)) ?>;

  const orderStatusConfig = {
    type: 'bar',
    data: {
      labels: orderStatusLabels,
      datasets: [{
        label: 'Số đơn hàng',
        data: orderStatusData,
        backgroundColor: '#4BC0C0',
        borderColor: '#388E8E',
        borderWidth: 1
      }]
    },
    options: {
      indexAxis: 'y',
      responsive: true,
      scales: {
        x: {
          beginAtZero: true,
          ticks: { precision: 0 }
        }
      },
      plugins: {
        title: {
          display: true,
          text: 'Thống kê đơn hàng theo trạng thái'
        },
        legend: { display: false }
      }
    }
  };

  new Chart(document.getElementById('orderStatusChart'), orderStatusConfig);

  // Biểu đồ doanh thu
  const revenueLabels = <?= json_encode(array_keys($revenue_by_date)) ?>;
  const revenueData = <?= json_encode(array_values($revenue_by_date)) ?>;

  const revenueConfig = {
    type: 'line',
    data: {
      labels: revenueLabels,
      datasets: [{
        label: 'Doanh thu (VND)',
        data: revenueData,
        borderColor: '#36A2EB',
        backgroundColor: 'rgba(54,162,235,0.1)',
        tension: 0.4,
        fill: true
      }]
    },
    options: {
      responsive: true,
      plugins: {
        title: {
          display: true,
          text: 'Thống kê doanh thu theo ngày'
        }
      },
      scales: {
        y: {
          beginAtZero: true,
          ticks: {
            callback: function(value) {
              return value.toLocaleString() + ' đ';
            }
          }
        }
      }
    }
  };

  new Chart(document.getElementById('revenueChart'), revenueConfig);
</script>
</body>
