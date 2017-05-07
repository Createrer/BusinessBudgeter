<script src="bootstrap/js/bootstrap.min.js"></script>
<header class="header" id="Header">
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="home"><img src="images/bb-logo.png" alt="Business Budgeter" class="img-responsive" title="Business Budgeter"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	<li class="dropdown">
          		<a href="javascript:void(0)" data-toggle="dropdown" title="Log Out Here" class="dropdown-toggle" style="font-size:12px; font-weight:bold">
          			<img src="images/profileicon-small.gif" style="border-radius:50%; margin-right:5px;">${userName.firstName} ${userName.lastName}<b class="caret"></b>
          		</a>
          		<ul class="dropdown-menu">
					<li><a href="${pageContext.request.contextPath}/logout.htm">Logout</a></li>
				</ul>
          	</li>
          </ul>
        </div>
      </div>
    </nav>
</header>