<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="js/autoNumeric.js"></script>
 <script type="text/javascript">
	
</script>
<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style> 
<div id="new-cash-drawer-popup"> 
   
    <form method="post" id="add-new-cash-drawer-popup" name="add-new-cash-drawer-popup">
		<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Add New Drawer</h4>
      </div>
      <div class="modal-body">
        <div class="col-md-6">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Drawer Name :</label>
            <input name="drawername" id="drawername" type="text" class="input-text form-control" value=""  size="15"/>
      		<input type="hidden" name="drawerid" class="form-control"  value="${purchaseBeverageList.purchaseId}">
          </div>
		</div><!--- col-md-6 -->
		
		<div class="col-md-6">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Drawer Description :</label>
           	<input name="drawerdisc" id="drawerdisc" type="text" class="input-text form-control" value=""  size="30"/>
          </div>
		</div><!--- col-md-3 -->
		</div>
      <div class="modal-footer" style="overflow:hidden">
       <button type="button" class="btn btn-success" onclick="saveBeveragePurchase();" >Add</button>
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
       </div>
    </div>
  </div>
	</form>
</div>
