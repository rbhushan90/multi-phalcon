  <div class="navbar  navbar-inverse">
    <div class="navbar-inner">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
      <div class="container" style="width:1120px;">
        {{ elements.getMenu()}}
      </div>
    </div><!-- /navbar-inner -->
  </div>
<div class="subhead-collapse">
        <div  id ="logopri" class="subhead">
          <div class="container">
            <div class="span6">
                <!-- get elements in libarary -->
                <a href="" >
                  <img alt="Bảo Kim JSC" src="http://www.google.com/images/logos/google_logo_41.png">
                </a>
            </div><!-- end sapn6-->
          </div><!-- container -->
      </div><!-- subhead -->
</div><!-- subhead-collapse collapse -->
  <div class="container">
        <div class="row" >
        <div class="span2">
        <ul class="nav nav-pills nav-stacked">
          <li class="active"><a href="#"><i class="fa fa-user-md fa-fw fa-1g"></i> Thông tin tài khoản</a></li>
          <li><a href=""><i class="fa fa-book fa-fw"></i>  Nạp tiền</a></li>
          <li><a href="transfer"><i class="fa fa-pencil fa-fw"></i> Chuyển tiền</a></li>
          <li><a href="#"><i class="fa fa-money fa-fw"></i>  Rút tiền</a></li>
            <li><a href="#"><i class="fa fa-cogs fa-fw"></i>   Lịch sử giao dịch</a></li>
        </ul>
        <hr>
        <ul class="nav nav-pills">
          <li class="active"><a href="#"><i class="fa fa-user-md fa-fw fa-1x"></i>Người bán  </a></li>
          <li><a href="#"><i class="fa fa-book fa-fw"></i>  Nạp tiền</a></li>
          <li><a href="#"><i class="fa fa-pencil fa-fw"></i> Chuyển tiền</a></li>
          <li><a href="#"><i class="fa fa-money"></i>  Rút tiền</a></li>
            <li><a href="#"><i class="fa fa-cogs fa-fw"></i>   Lịch sử giao dịch</a></li>
        </ul>
        </div>
        <div class="span10">
          {{ content() }}
        </div><!-- span10 -->

      </div><!-- row -->


<footer>
Made with love by the Phalcon Team

    {{ link_to("privacy", "Privacy Policy") }}
    {{ link_to("terms", "Terms") }}

© 2013 Phalcon Team.
</footer>