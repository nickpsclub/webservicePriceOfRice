
$(document).ready(function(){
	$('.collapsible').collapsible({
	  accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
	});
	$('select').material_select();
});
        

$('#description').trigger('autoresize');

loadSelectSeedRice();
var idSeedRice = $("#selectDataSeedRice").val().split(":")[0]
loadData(idSeedRice);

function loadSelectSeedRice(){
	var dataSeedrice = $.ajax({ 
		type: "GET", headers: { Accept: 'application/json' }, 
		contentType: "application/json; charset=utf-8", 
		dataType: "json", 
		url: session['context']+'/seedrices/findAllSeedRice',  
		async: false 
	}).responseJSON;

	for(var i=0;i<dataSeedrice.length;i++){
		$("#selectDataSeedRice").append(''+
			'<option value="'+dataSeedrice[i].id+":"+dataSeedrice[i].version+'">'+dataSeedrice[i].seedRiceName+'</option>'
		);

		$("#selectEditDataSeedRice").append(''+
			'<option value="'+dataSeedrice[i].id+":"+dataSeedrice[i].version+'">'+dataSeedrice[i].seedRiceName+'</option>'
		);

		$("#selectAddDataSeedRice").append(''+
			'<option value="'+dataSeedrice[i].id+":"+dataSeedrice[i].version+'">'+dataSeedrice[i].seedRiceName+'</option>'
		);
	}
}


$("#selectDataSeedRice").on('change',function(){
	idSeedRice = $("#selectDataSeedRice").val().split(":")[0]
	loadData(idSeedRice)
})

function loadData(idSeedRice){

	var dataTypeRice = $.ajax({ 
		type: "GET", headers: { Accept: 'application/json' }, 
		contentType: "application/json; charset=utf-8", 
		dataType: "json", 
		url: session['context']+'/typerices/findAllTypeRiceBySeedRice',
		data:{id:idSeedRice},  
		async: false 
	}).responseJSON;

	$("#tableDataTypeRice").empty();
	for(var i=0;i<dataTypeRice.length;i++){
		$("#tableDataTypeRice").append(''+
			'<tr>'+
				'<td>'+
    				'<input type="checkbox" class="filled-in" id="'+dataTypeRice[i].id+'" value="'+dataTypeRice[i].id+":"+dataTypeRice[i].seedRice.id+'" name="checkBox" onclick="checkBox(this)"/>'+
    				'<label for="'+dataTypeRice[i].id+'"></label>'+
				'</td>'+
				'<td>'+
					'<a class="btn-floating btn-large red" onclick="edit(this)" idEdit="'+dataTypeRice[i].id+'" version="'+dataTypeRice[i].version+'">'+
      					'<i class="large material-icons">mode_edit</i>'+
    				'</a>'+
				'</td>'+
				'<td>'+
					dataTypeRice[i].typeRiceCode+
				'</td>'+
				'<td>'+
					dataTypeRice[i].typeRiceName+
				'</td>'+
				'<td>'+
					dataTypeRice[i].description+
				'</td>'+
			'</tr>');
	}
}

$("#btnAddTypeRice").on('click',function(){
	$("#modalAddDataTypeRice").openModal();
	clearData()
})

$("#btnSave").on('click',function(){
	var check = 0;

	var idSeedRice = $("#selectAddDataSeedRice").val().split(":")[0]
	var typeRiceCode = $("#typeRiceCode").val()
	var typeRiceName = $("#typeRiceName").val()
	var description = $("#description").val()

	var data = {
		typeRiceCode:typeRiceCode,
		typeRiceName:typeRiceName,
		description:description,
		version:0,
		seedRice:{id:idSeedRice,version:0}
	}

	saveDataTypeRice(check,data,idSeedRice)
})

$("#btnNext").on('click',function(){
	var check = 1;

	var idSeedRice = $("#selectAddDataSeedRice").val().split(":")[0]
	var typeRiceCode = $("#typeRiceCode").val()
	var typeRiceName = $("#typeRiceName").val()
	var description = $("#description").val()

	var data = {
		typeRiceCode:typeRiceCode,
		typeRiceName:typeRiceName,
		description:description,
		version:0,
		seedRice:{id:idSeedRice,version:0}
	}

	saveDataTypeRice(check,data,idSeedRice)
})

function saveDataTypeRice(check,data,idSeedRice){
	var jsonDataSave = $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        headers: {
            Accept: "application/json"
        },
        url: session['context'] + '/typerices',
        data: JSON.stringify(data),
        complete: function(xhr)
        {
			if (xhr.readyState == 4) {
				if (xhr.status == 201) {
					if(check==0){
						swal({
				            title: Message.Success,
				            type: 'success',
				            confirmButtonText: Message.OK
				        });
						$("#modalAddDataTypeRice").closeModal();
					}
					clearData();
					loadData(idSeedRice);
				}else if (xhr.status == 200){
					swal(
		               'Fail',
		               	Message.Fail,
		               'error'
		              );
				}else{
					swal(
		               'Fail',
		               	Message.Fail,
		               'error'
		              );
				}
			}else{
				swal(
	               'Fail',
	               	Message.Fail,
	               'error'
	            );
			}
		},
		async: false
	});
}

var idTypeRiceEdit;
var versionTypeRiceEdit;
function edit(btn){
	$("#modalAddTypeRiceEdit").openModal();
	idTypeRiceEdit = btn.getAttribute('idEdit')
	versionTypeRiceEdit = btn.getAttribute('version')

	var dataTypericeEdit = $.ajax({ 
		type: "GET", headers: { Accept: 'application/json' }, 
		contentType: "application/json; charset=utf-8", 
		dataType: "json", 
		url: session['context']+'/typerices/findTypeRiceById',
		data:{id:idTypeRiceEdit},  
		async: false 
	}).responseJSON;


	$("#typeRiceCodeEdit").val(dataTypericeEdit.typeRiceCode);
	$("#typeRiceCodeEdit").focus();
	$("#typeRiceNameEdit").val(dataTypericeEdit.typeRiceName);
	$("#typeRiceNameEdit").focus();
	$("#descriptionEdit").val(dataTypericeEdit.description);
	$("#descriptionEdit").focus();
}

$("#btnSaveEdit").on('click',function(){
	var typeRiceCodeEdit = $("#typeRiceCodeEdit").val()
	var typeRiceNameEdit = $("#typeRiceNameEdit").val()
	var descriptionEdit = $("#descriptionEdit").val()
	var selectEditDataSeedRiceId = $("#selectEditDataSeedRice").val().split(":")[0]
	var selectEditDataSeedRiceVersion = $("#selectEditDataSeedRice").val().split(":")[1]

	var data = {
		typeRiceCode : typeRiceCodeEdit,
		typeRiceName: typeRiceNameEdit,
		description: descriptionEdit,
		version : versionTypeRiceEdit,
		seedRice:{id:selectEditDataSeedRiceId,version:selectEditDataSeedRiceVersion}
	}
	editData(data,selectEditDataSeedRiceId);
})

function editData(data,selectEditDataSeedRiceId){
	var jsonDataEdit = $.ajax({
        type: "PUT",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        headers: {
            Accept: "application/json"
        },
        url: session['context'] + '/typerices/'+idTypeRiceEdit,
        data: JSON.stringify(data),
        complete: function (xhr) {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                	swal({
			            title: Message.Success,
			            type: 'success'
			        });
			        loadData(selectEditDataSeedRiceId);
					$("#modalAddTypeRiceEdit").closeModal();
                }else{
                	swal(
		               'Fail',
		               	Message.Fail,
		               'error'
		            );
                }
            }else{
            	swal(
	               'Fail',
	               	Message.Fail,
	               'error'
	            );
            }
        },
        async: false
    });
}

$("#btnDeleteTypeRice").on('click',function(){
	var countDelete = $("input[name='checkBox']:checked:enabled").length;
	if(countDelete==0){
		swal({
		    title: Message.ConfirmDelete,
		    text: Message.PleaseSelect,
		    type: 'warning',
		    confirmButtonText: Message.OK
		})
	}else{
		swal({
		    title: Message.ConfirmDelete,
		    text: Message.Deleteing+" "+countDelete+" "+Message.Recode,
		    type: 'warning',
		    confirmButtonColor: '#3085d6',
		    cancelButtonColor: '#d33',
		    confirmButtonText: Message.OK,
		    closeOnConfirm: false,
		    showCancelButton: true,
		    cancelButtonText: Message.Cancel
		},
		function() {
			var idSeedRice
			for(var i = 0; i < $("[name='checkBox']").length; i++) {
		        if ($("[name='checkBox']")[i].checked == true) {
		            var id = $("[name='checkBox']")[i].getAttribute('id')
		            idSeedRice = $("[name='checkBox']")[0].getAttribute('value').split(":")[1]
		            var data = $.ajax({
		                type: "DELETE",
		                contentType: "application/json; charset=utf-8",
		                dataType: "json",
		                headers: {
		                    Accept: "application/json"
		                },
		                url:session['context']+"/typerices/"+id,
		                complete: function (xhr) {
		                    lengthOfResponseText = xhr.responseText.length;
		                },
		                async: false
		            });
		        }
		    }
		    swal(
		      	'Deleted!',
		      	Message.DeleteSuccess,
		      	'success',
		      	loadData(idSeedRice)
		    );
		});
	}
});

function clearData(){
	$("#typeRiceCode").val("")
	$("#typeRiceName").val("")
	$("#description").val("")
}

function checkBox() {
	var countInputChecked = $("input[name='checkBox']:checked:enabled").length;
	var countInputAll  = $("[name='checkBox']").length;
	if(countInputChecked == countInputAll){
		$("#checkBoxAll").prop("checked",true);
	}else{
		$("#checkBoxAll").prop("checked",false);	
	}
};

$("#checkBoxAll").on('change',function(){
	var booleanCheckAll = $("#checkBoxAll").prop("checked");
	if(booleanCheckAll){
		$("[name='checkBox']").prop("checked",true);
	}else{
		$("[name='checkBox']").prop("checked",false);
	}
});