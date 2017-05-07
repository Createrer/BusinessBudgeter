<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="js/autoNumeric.js"></script>
 <script type="text/javascript">
	 $(document).ready(function() {
	 	$(':input').click(function() {
	        $(this).select();

	    });
		 $(".foodPurchase").autoNumeric();
	});
	
	$(function(){
        $("#foodPrice").on('blur', function(){
            if(this.value != null && this.value.match(/^\d{1,3}(,?\d{3})*?(.\d*)?$/)){
                 this.value=this.value.replace(/,/g, "");
               }
        });
    });
</script> 
<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style>
<div id="food-purchase-popup"> 
   
   <form method="post" id="add_food_purchase_popup" name="add_food_purchase_popup">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Food Purchase</h4>
      </div>
      <div class="modal-body">
        <div class="col-md-6">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Food Name :</label>
            <input name="purchaseFoodName" id="purchaseFoodName" type="text" class="input-text form-control" value="" size="15"/>
		     <input type="hidden" name="purchaseId " value="">
          </div>
		</div><!--- col-md-6 -->
		
		<div class="col-md-6">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Food Price :</label>
            <input name="purchaseFoodValue" type="text" class="input foodPurchase form-control" value="" onkeyup="purchaseKeyUp()"  onkeypress="javascript:return isNumber (event), addPurchase()" id="foodPrice" size="6" data-v-max="9999999.99" data-m-dec="2"/>
          </div>
		</div><!--- col-md-3 -->
		</div>
      <div class="modal-footer" style="overflow:hidden">
       <button type="button" class="btn btn-success" onclick="saveFoodPurchase();">Add</button>
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
       </div>
    </div>
  </div>
	</form>
</div>
