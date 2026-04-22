<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <title>Đăng ký - Mesach</title>
    <link rel="stylesheet" href="csstranglogin.css" />
</head>

<body>
    <div class="header">
        <div class="logo">
            <a href="trangchumesach.php">
                <img src="../anh/meesach.jpg" alt="mesach" />
            </a>
        </div>
    </div>

    <div class="login-box">
        <h2>Đăng ký tài khoản</h2>
        <form>
            <label>Họ và tên</label>
            <input type="text" placeholder="Nhập họ tên của bạn" />

            <label>Số điện thoại/Email</label>
            <input type="text" placeholder="Nhập số điện thoại hoặc email" />

            <label>Mật khẩu</label>
            <input type="password" placeholder="Nhập mật khẩu" />

            <label>Nhập lại mật khẩu</label>
            <input type="password" placeholder="Xác nhận mật khẩu" />

            <div class="btn-group">
                <button type="submit" style="width: 100%;">Đăng Ký</button>
            </div>

            <p class="forgot" style="text-align: center; margin-top: 15px;">
                Bạn đã có tài khoản? <a href="tranglogin.php">Đăng nhập</a>
            </p>
        </form>
    </div>
</body>

</html>