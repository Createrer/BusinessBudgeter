<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="js/autoNumeric.js"></script>
 <script type="text/javascript">
	 $(document).ready(function() {
	 	$(':input').click(function() {
	        $(this).select();

	    });
	    
	    $(".beveragePurchase").autoNumeric();
	});
	
	$(function(){
        $("#beveragePrice").on('blur', function(){
            if(this.value != null && this.value.match(/^\d{1,3}(,?\d{3})*?(.\d*)?$/)){
                 this.value=this.value.replace(/,/g, "");
               }
        });
    });
</script>
<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style> 
<div id="beverage-purchase-popup"> 
   
    <form method="post" id="add_beverage_purchase_popup" name="add_beverage_purchase_popup">
		<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Beverage Purchase</h4>
      </div>
      <div class="modal-body">
        <div class="col-md-6">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Beverage Name :</label>
            <input name="purchaseBeverageName" id="purchaseBeverageName" type="text" class="input-text form-control" value=""  size="15"/>
      		<input type="hidden" name="purchaseBeverageId" class="form-control"  value="${purchaseBeverageList.purchaseId}">
          </div>
		</div><!--- col-md-6 -->
		
		<div class="col-md-6">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Beverage Price :</label>
            <input name="purchaseBeverageValue" type="text"  onkeyup="purchaseKeyUp()" class="input beveragePurchase form-control" value="" onkeypress="javascript:return isNumber(event)" id="beveragePrice" size="6" data-v-max="9999999.99" data-m-dec="2"/>
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
