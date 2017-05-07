<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script type="text/javascript">
	$(document).ready(function() {
		 
	       $(".foodPurchase").each(function() {
	 				calculateFoodPurchase();
	           	$(this).keyup(function(){
	            	calculateFoodPurchase();
	            }); 
	        });
	        
			/* var foodVar = parseFloat($("#foodBudgetedAllowwance").val())- parseFloat($("#foodPurchaseTotal").val());
	        var bevVar = parseFloat($("#beverageBudgetedAllowwance").val())- parseFloat($("#beveragePurchaseTotal").val());*/	
            $("#foodVariance").val(parseFloat($("#foodBudgetedAllowwance").val())- parseFloat($("#foodPurchaseTotal").val()));
	        $("#beverageVariance").val(parseFloat($("#beverageBudgetedAllowwance").val())- parseFloat($("#beveragePurchaseTotal").val())); 
	       }); 
	        
	</script>

	<script type="text/javascript">
	$(function(){
			$('#cashUpCash input:text').keypress(function(e) {
				if(e.which == 13) { 
					updateCashup();
				}
			});
		}); 
		$(function(){
			$(".ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
			$(".ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
		});
	</script>

<div>
 <input type="hidden" name="purchaseFoodListSize" value="${purchaseFoodListSize}" >    
   
	  <table width="30%" cellspacing="0" cellpadding="0" border="0" bgcolor="#e0e0e0" >
	   <tbody>	 
		  <tr>
		    <td valign="top" colspan="2"><table width="100%" cellspacing="1" cellpadding="5" border="0" class="ServiceEevnt">
		  <tbody>
		  <tr>
		     <th align="center" class="thclass">Item Name</th>
		      <th width="12%" align="center" class=" thclass ">Price</th>
		  </tr>
		  <c:if test="${!empty purchaseFoodList}">
		  <c:forEach items="${purchaseFoodList}" var="purchaseFood" varStatus="loop" >
			  <tr >
			      <td   class="add-text">
			      	<input type="hidden" name="isDirtyFood${loop.index}" value="0" />
			      	<input disabled="disabled" name="purchaseFoodName${loop.index}" type="text" class="input-text" value="${purchaseFood.purchaseName }" onchange="makeDirty(document.cashUpCash.isDirtyFood${loop.index})"/>
			      	<input type="hidden" name="purchaseId${loop.index}" value="${purchaseFood.purchaseId}">   
			      </td>
			      <td  class="add-text">
			      	<input disabled="disabled" name="purchaseFoodValue${loop.index}" type="text" class="input foodPurchase" value="${purchaseFood.purchaseCost }" onkeyup="purchaseKeyUp()" onchange="makeDirty(document.cashUpCash.isDirtyFood${loop.index})" onkeypress="javascript:return isNumber (event)"/>
			      </td>
		      </tr>
		   </c:forEach> 
		   </c:if>
			<!-- <tr style="background: "><td colspan="2"><a href="javaScript:void(0)" class="add-button" onclick="addBeveragePurchase()">Add New Beverage</a> </td></tr> -->
				</tbody></table></td>
		    </tr>
		  <tr><td colspan="2"><table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#c0e057">
	 		<tbody><tr class="total">
	        <td width="60%">Purchases Total</td>
	         <td class="total"><input disabled="disabled" name="text7" id="foodPurchaseTotal" type="text" readonly class="input"  tabindex="-1" value="0.0"/></td>
	      </tr>
	       <!--  <tr style="background-color: #ffffff;">
	        <td style=" font-weight: bold;">Budgeted Allowwance</td>
	        <td><input name="text7" id="foodBudgetedAllowwance" type="text" readonly  class="input" value="5000"/></td>
	        <td>&nbsp;</td>
	        <td><input name="text7" id="beverageBudgetedAllowwance" type="text" readonly class="input" value="4000"/></td>
	 
	      </tr>
		  <tr class="total">
	        <td class="total">Variance</td>
	        <td class="total"><input name="text7" id="foodVariance" readonly type="text" value="" class="input" /></td>
	        <td class="total">&nbsp;</td>
	        <td class="total"><input name="text7" id="beverageVariance" readonly type="text" value="" class="input" /></td>
	 
	      </tr> -->
		 </tbody></table>
		</td></tr>
		  </table>
	</div>