<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script type="text/javascript">
	$(document).ready(function() {
		 
	        $(".beveragePurchase").each(function() {
	        
	 				calculateBeveragePurchase();
	                $(this).keyup(function(){
	            	calculateBeveragePurchase();
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
		 <input type="hidden" name="purchaseBeverageSize" value="${purchaseBeverageSize}" >    
	  <table width="30%" cellspacing="0" cellpadding="0" border="0" bgcolor="#e0e0e0">
	   <tbody>	 
		  <tr>
		    <td valign="top"><table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#c0e057" class="ServiceEevnt">
		  <tbody>
		  <tr>
		     <th align="center" class="thclass">Item Name</th>
		      <th width="12%" align="center" class=" thclass ">Price</th>
		  </tr>
		   <c:forEach items="${purchaseBeverageList}" var="purchaseBeverage" varStatus="loop">
		   		<tr style="background: ">
		      		<td>
		      			<input type="hidden" name="isDirtyBev${loop.index}" value="0" />
		      			<input disabled="disabled" name="purchaseBeverageName${loop.index}" type="text" class="input-text" value="${purchaseBeverage.purchaseName }" onchange="makeDirty(document.cashUpCash.isDirtyBev${loop.index})"/>
		      			<input type="hidden" name="purchaseBeverageId${loop.index}" value="${purchaseBeverage.purchaseId}">
		      		</td>
			        <td>
			        	<input disabled="disabled" name="purchaseBeverageValue${loop.index}" type="text" onkeyup="purchaseKeyUp()" class="input beveragePurchase" value="${purchaseBeverage.purchaseCost }" onchange="makeDirty(document.cashUpCash.isDirtyBev${loop.index})" onkeypress="javascript:return isNumber (event)"/>
			        </td>
		         </tr>
		    </c:forEach>
			<!-- <tr style="background: "><td ><a href="javaScript:void(0)" class="add-button" onclick="addBeveragePurchase()">Add New Beverage</a></td></tr> -->
				</tbody></table></td>
		    </tr>
		  <tr><td colspan="4"><table width="100%" cellspacing="1" cellpadding="5" border="0">
	 		<tbody><tr class="total">
	        <td  width="60%">Purchases Total</td>
	        <td class="total"><input  name="text7" id="beveragePurchaseTotal" type="text" readonly class="input"  tabindex="-1" value="0.0"/></td>
	 
	      </tr>
		 </tbody></table>
		</td></tr>
		  </table>
	</div>