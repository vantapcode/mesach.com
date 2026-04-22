<?php include("connect.php"); ?>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Mesach Clone</title>
    <link rel="stylesheet" href="csstrangchumesach.css" />

    <!--ICON-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
  </head>
  <body>

    <!-- HEADER -->
    <header class="header">
      <div class="menu-icon">
        <a href="danhmucsanpham.php">
          <i class="fa-solid fa-bars"></i>
        </a>
      </div>
      <div class="logo">
        <a href="trangchumesach.php">
          <img src="../anh/mesach.png" class="logo" />
        </a>
      </div>

      <div class="search-box">
        <input type="text" placeholder="Tìm sách...">

        <button>
          <i class="fa-solid fa-magnifying-glass"></i>
        </button>
      </div>

      <div class="nav-icons">
          <a href="thongbao.php">
            <i class="fa-regular fa-bell"></i>
          </a>
          <a href="giohang.php">
            <i class="fa-solid fa-cart-shopping"></i>
          </a>
          <?php
            $user = "User"; // giả lập
          ?>

          <a href="tranglogin.php">
            <i class="fa-regular fa-user"></i>
            <?php echo $user; ?>
          </a>
        </div>

      <div class="greeting"> 
        <?php
          date_default_timezone_set("Asia/Ho_Chi_Minh");

          $hour = date("H");

          if ($hour < 12) {
              echo "<p>🌅 Chào buổi sáng!</p>";
          } elseif ($hour < 18) {
              echo "<p>🌤 Chào buổi chiều!</p>";
          } else {
              echo "<p>🌙 Chào buổi tối!</p>";
          }
        ?>
      </div>
    </header>

    <!-- BANNER -->
    <section class="banner">
      <div class="banner-left">
        <h1 class="banner-title">TOP SÁCH BÁN CHẠY</h1>
        <h2 class="banner-sub">KHÁM PHÁ TRI THỨC MỖI NGÀY</h2>
        <p class="banner-sale">
          Giảm đến <span>30%</span>
        </p>
      </div>
        <img src="../anh/anhbanner.png" class="banner-img">

      <div class="banner-right">
        <h2 class="banner-right-title">SÁCH HOT</h2>
        <p class="banner-right-sub">Ưu đãi đến</p>
        <p class="banner-right-sale">20%</p>
      </div>
    </section>

    <!-- CATEGORY -->
    <section class="categories">
      <div class="card">
        <h4>SUMMER READING</h4>
        <a href="summer.php">
          <button>MUA NGAY</button>
        </a>
      </div>

      <div class="card">
        <h4>PHÁT TRIỂN BẢN THÂN</h4>
        <a href="phattrienbanthan.php">
          <button>MUA NGAY</button>
        </a>
      </div>

      <div class="card">
        <h4>DU LỊCH</h4>
        <a href="dulich.php">
          <button>MUA NGAY</button>
        </a>
      </div>

      <div class="card">
        <h4>SÁCH THIẾU NHI</h4>
        <a href="thieunhi.php">
        <button>MUA NGAY</button>
        </a>
      </div>
    </section>

      <!-- PRODUCT LIST -->
<?php
  $sql = "SELECT * FROM SanPham";
  $result = $conn->query($sql);[]
?>

<section class="product-list">
<?php while($b = $result->fetch_assoc()): ?>
  <div class="product-card">

    <a href="#">
      <?php
        $base = "../anh/" . $b['MaSP'];

        if (file_exists($base . ".png")) {
            $img = $base . ".png";
        } elseif (file_exists($base . ".jpg")) {
            $img = $base . ".jpg";
        } elseif (file_exists($base . ".jpeg")) {
            $img = $base . ".jpeg";
        } else {
            $img = "../anh/default.png";
        }
      ?>
      <img src="<?= $img ?>" alt="<?= $b['TenSP'] ?>">
    </a>

    <h3><?= $b['TenSP'] ?></h3>

    <div class="rating">⭐⭐⭐⭐</div>

    <div class="price">
      <span class="new">
        <?= number_format($b['GiaBan']) ?>đ
      </span>
      <span class="old"></span>
    </div>

    <button class="cart">🛒</button>

  </div>
<?php 
  endwhile; 
?>
</section>

<!-- FOOTER -->
    <footer class="footer">
      <div class="footer-container">
        <!-- CỘT 1 -->
        <div class="footer-col">
          <a href="trangchumesach.php">
            <img src="../anh/meme.png" class="footer-logoo" />
          </a>

          <p>
            170 An Dương Vương, tỉnh Gia Lai<br />
            mesach.com là kênh bán sách trực tuyến, hỗ trợ đặt hàng online nhanh
            chóng và giao sách tận nơi cho khách hàng trên toàn quốc.
          </p>
          <a>
            <img src="../anh/logocuoi.png" class="footer-log" />
          </a>
        </div>

        <!-- CỘT 2 -->
        <div class="footer-col">
          <h3>DỊCH VỤ</h3>
          <ul>
            <li>Điều khoản sử dụng</li>
            <li>Chính sách bảo mật</li>
            <li>Chính sách thanh toán</li>
            <li>Giới thiệu Mê sách</li>
            <li>Hệ thống nhà sách</li>
          </ul>
          <h4>LIÊN HỆ</h4>
          <ul>
          <li>📍170 An Dương Vương</li>
          </ul>
          <a>
            <img src="../anh/momo.png" class="footer-logo" />
          </a>
        </div>

        <!-- CỘT 3 -->
        <div class="footer-col">
          <h3>HỖ TRỢ</h3>
          <ul>
            <li>Chính sách đổi trả</li>
            <li>Chính sách bảo hành</li>
            <li>Chính sách vận chuyển</li>
            <li>Chính sách khách sỉ</li>
          </ul>
          <ul>
            <br></br>
            <li>📧cskh@mesach.com.vn</li>
          </ul>
          <a>
            <img src="../anh/shopee.png" class="footer-logo" />
          </a>
        </div>

        <!-- CỘT 4 -->
        <div class="footer-col">
          <h3>TÀI KHOẢN CỦA TÔI</h3>
          <ul>
            <li><a href="tranglogin.php">Đăng nhập / Tạo tài khoản</a></li>
            <li>Thay đổi địa chỉ</li>
            <li>Chi tiết tài khoản</li>
            <li>Lịch sử mua hàng</li>
          </ul>
          <ul>
            <br></br>
            <li>📞1900 1234</li>
          </ul>
          <a>
            <img src="../anh/vnpay.png" class="footer-logo" />
          </a>
        </div>
      </div>
    </footer>
  </body>
</html>