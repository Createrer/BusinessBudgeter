<div id="template-popup"> 
   <form method="post" id="save-roster-as-template" name="save-roster-as-template">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Save As Template</h4>
      </div>
      <div class="modal-body">
        <div class="col-md-6">
			<form>
          <div class="form-group">
             <label for="recipient-name" class="control-label label1">Template Name :</label> 
             <input type="hidden" name="templateId" id="templateId" class="form-control" value="">
		     <input name="templateName" id="templateName" class="form-control" type="text" class="input-text" value="" size="15"/>
            
          </div>
        </form>
		</div><!--- col-md-6 -->
		
      </div>
      <div class="modal-footer" style="overflow:hidden">
       <button type="button" class="btn btn-success" onclick="saveTemplateData()">Add</button>
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
       </div>
    </div>
  </div>
</div>



	</form>
</div>