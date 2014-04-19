{{ content() }}

<!-- <header class="jumbotron subhead" id="overview">
  <div class="hero-unit">
    <h1>Welcome!</h1>
    <p class="lead">This is a website secured by Phalcon Framework</p>

    <div align="right">
      {#{ link_to('session/signup', '<i class="fa fa-plus-circle"></i> Tạo tài khoản', 'class': 'btn btn-primary btn-large') }#}
    </div>
  </div>
</header>

<div class="row">

    <div class="span4">
      <div class="well">
        <h3>Phalcon php </h3>
        <p>  Tốc độ thử nghiệm cần hơn nhiều lần các thư viện khác mà kỹ thuật lập trình không quá khó. Phalcon phục vụ được nhiều truy cập/giây hơn YII khoảng 6.6 lần, nhanh hơn CodeIgniter 4.3…</p>
        <p>
Phalcon-Nginx-PHPFPM phù hợp với triển khai trên Virtual Private Server (mô hình hosting cloud dùng ảo hoá) giúp cho lập trình viên có khả năng điều khiển máy chủ tốt hơn nhiều so với shared hosting (nhiều trang web lưu trên một máy chủ web).
</p>
      </div>
    </div>

    <div class="span4">
      <h3>Cài đặt Phalcon</h3>
      <p>Các bạn có thể tham khảo <a href="http://docs.phalconphp.com/en/latest/reference/install.html">tại website</a></p>
      <p>Sử dụng Openshift làm hosting, để chạy được phalcon yêu cầu hosting đó hổ trợ cphalcon, các bạn có thể cài đặt trên đó dễ dàng</p>
    </div>

    <div class="span4">
      <h3>Địa chỉ liên hệ</h3>
      <address>
        <strong>Ecosy.vn, Inc.</strong><br>
        22/10, Nguyen cua van, Binh Thanh<br>
        <abbr title="Phone">P:</abbr> (84) 909-340-777
      </address>
      <address>
        <strong>E-mail</strong><br>
        <a href="mailto:#">fcduythien@gmail.com</a>
      </address>
    </div>

  </div>
 -->

    <div class="flash">
               {% set userLogin= session.get('auth-front')%}
               {% if userLogin['username'] is defined%}
              <div class="alert alert-info">
                  You are currently logged in username: {{userLogin['username']}}
              </div>
              {% else %}
              <div class="alert alert-info">
                  You are currently not logged in. Please log in to see all your books
              </div>
              {% endif %}
    </div>

  <div class="row splash-block">
        <div class="span6">
          <h1>Welcome to You <sup>Beta</sup></h1>
          <h2>The new learning environment from Ecosy</h2>
        </div>
        <div class="span6">
          <ul class="nav nav-tabs">
            <li><a href="/about"><i class="fa fa-linux fa-3x"></i><p>Read</p></a></li>
            <li><a href="/about"><i class="fa fa-play fa-3x"></i><p>Watch</p></a></li>
            <li><a href="/about"><i class="fa fa-code fa-3x"></i><p>Code</p></a></li>
            <li><a href="/about"><i class="fa fa-comment fa-3x"></i><p>Comment</p></a></li>
            <li><a href="/about"><i class="fa fa-terminal fa-3x"></i><p>Fork</p></a></li>
            <li><a href="/about"><i class="fa fa-github fa-3x"></i><p>Source</p></a></li>
          </ul>
        </div>
  </div>

<div class="row">
  <div class="span3" id="tags">
    <ul class="list medium">
      <li class="list-item">
        <a href="/books" class="">
          All <i class="fa fa-chevron-right"></i> 
        </a>
      </li> 
        <li class="list-item">
          <a href="/tags/velocity" class="">
            velocity Linux <i class="fa fa-chevron-right"></i> 
          </a>
        </li>         
        <li class="list-item">
          <a href="" class="">
            Early Release <i class="fa fa-chevron-right"></i> 
          </a>
        </li>         
        <li class="list-item">
          <a href="" class="">
            Fluent <i class="fa fa-chevron-right"></i> 
          </a>
        </li>         
        <li class="list-item">
          <a href="/tags/Featured" class="active">
            Featured <i class="fa fa-chevron-right"></i> 
          </a>
        </li>         
        <li class="list-item">
          <a href="" class="">
            Ecosy <i class="fa fa-chevron-right"></i> 
          </a>
        </li>         
        <li class="list-item">
          <a href="/tags/OSCON" class="">
            OSCON <i class="fa fa-chevron-right"></i> 
          </a>
        </li>         
        <li class="list-item">
          <a href="/tags/Strata" class="">
            Strata <i class="fa fa-chevron-right"></i> 
          </a>
        </li>         
    </ul>
  </div>

  <div id="books" class="span9">
      <div class="row"> 
            <div class="span1">&nbsp;</div>
            <div class="span2 book">
            <div class="coverimage">
              <a href="/books/1234000001805">
                {{image('img/book/java.png')}}
              </a>
            </div>
            <h4><a href="">Learning Java</a></h4>
            </div>
            <div class="span2 book">
              <div class="coverimage">
                <a href="">
                  {{image('img/book/node.png')}}
                </a>
              </div>
              <h4><a href="">Node: Up and Running</a></h4>
            </div>
            <div class="span2 book">
              <div class="coverimage">
                <a href="">
                  {{image('img/book/javacript.png')}}
                </a>
              </div>
              <h4><a href="">Programming JavaScript Applications</a></h4>
            </div>
            <div class="span2 book">
              <div class="coverimage">
                <a href="">
                  {{image('img/book/html5.png')}}
                </a>
              </div>
              <h4><a href="/books/1234000001654">HTML5 Canvas</a></h4>
            </div>
            <div class="clear"></div>
      </div><!-- end row -->
      <div class="row"> 
            <div class="span1">&nbsp;</div>
            <div class="span2 book">
                  <div class="coverimage">
                    <a href="">
                      {{image('img/book/git.png')}}
                    </a>
                  </div>
                  <h4><a href="">Git Pocket Guide</a></h4>
            </div>
            <div class="span2 book">
              <div class="coverimage">
                <a href="">
                  {{image('img/book/lite.png')}}
                </a>
              </div>
              <h4><a href="/books/1234000000726">Études for Erlang</a></h4>
            </div>
            <div class="span2 book">
              <div class="coverimage">
                <a href="">{{image('img/book/python.png')}}</a>
              </div>
              <h4><a href="">Python Cookbook</a></h4>
            </div>
            <div class="span2 book">
              <div class="coverimage">
                <a href="">
                  {{image('img/book/java.png')}}
                </a>
              </div>
              <h4><a href="">Open Government</a></h4>
            </div>
            <div class="clear"></div>
      </div><!-- end row -->
      <div class="row"> 
            <div class="span1">&nbsp;</div>
            <div class="span2 book">
            <div class="coverimage">
              <a href="/books/1234000001805">
                {{image('img/book/java.png')}}
              </a>
            </div>
            <h4><a href="">Learning Java</a></h4>
            </div>
            <div class="span2 book">
              <div class="coverimage">
                <a href="">
                  {{image('img/book/node.png')}}
                </a>
              </div>
              <h4><a href="">Node: Up and Running</a></h4>
            </div>
            <div class="span2 book">
              <div class="coverimage">
                <a href="">
                  {{image('img/book/javacript.png')}}
                </a>
              </div>
              <h4><a href="">Programming JavaScript Applications</a></h4>
            </div>
            <div class="span2 book">
              <div class="coverimage">
                <a href="">
                  {{image('img/book/html5.png')}}
                </a>
              </div>
              <h4><a href="/books/1234000001654">HTML5 Canvas</a></h4>
            </div>
            <div class="clear"></div>
      </div><!-- end row -->
  </div><!-- end sapn9 book -->
</div><!-- end row -->