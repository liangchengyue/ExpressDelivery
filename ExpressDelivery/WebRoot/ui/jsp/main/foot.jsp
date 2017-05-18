
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="footer">
	<div class="footer-inner">2017 &copy; 老司机</div>
	<div class="footer-tools">
		<span class="go-top"> <i class="fa fa-angle-up"></i>
		</span>
	</div>
</div>
<jsp:include page="/ui/jsp/commont/foot-script.jsp" />
<script src="ui/assets/scripts/index.js" type="text/javascript"></script>
<script src="ui/assets/scripts/tasks.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
	jQuery(document).ready(function() {
		App.init(); // initlayout and core plugins
		Index.init();
	});
</script>

