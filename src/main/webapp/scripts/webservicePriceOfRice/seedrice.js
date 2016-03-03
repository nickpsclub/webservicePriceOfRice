 // $(document).ready(function(){
 //      $('.parallax').parallax();
 //    });

loadData();
function loadData(){

	var dataSeedrice = $.ajax({ 
		type: "GET", headers: { Accept: 'application/json' }, 
		contentType: "application/json; charset=utf-8", 
		dataType: "json", 
		url: session['context']+'/seedrices/findAllSeedRice',  
		async: false 
	}).responseJSON;

	$("#tableDataSeedRice").empty();

	for(var i=0;i<dataSeedrice.length;i++){
		$("#tableDataSeedRice").append(''+
			'<tr>'+
				'<td>'+
    				'<input type="checkbox" class="filled-in" id="'+dataSeedrice[i].id+'" value="'+dataSeedrice[i].id+'" name="checkBoxSeedRice" onclick="checkBox(this)"/>'+
    				'<label for="'+dataSeedrice[i].id+'"></label>'+
				'</td>'+
				'<td>'+
					'<a class="btn-floating btn-large red" onclick="editSeedrice(this)" idEdit="'+dataSeedrice[i].id+'" version="'+dataSeedrice[i].version+'">'+
      					'<i class="large material-icons">mode_edit</i>'+
    				'</a>'+
				'</td>'+
				'<td>'+
					dataSeedrice[i].seedRiceCode+
				'</td>'+
				'<td>'+
					dataSeedrice[i].seedRiceName+
				'</td>'+
			'</tr>');
	}
};

var idSeedRiceEdit;
var versionSeedRiceEdit;
function editSeedrice(btn){
	$("#modalAddSeedRiceEdit").openModal();
	idSeedRiceEdit = btn.getAttribute('idEdit')
	versionSeedRiceEdit = btn.getAttribute('version')

	var dataSeedriceEdit = $.ajax({ 
		type: "GET", headers: { Accept: 'application/json' }, 
		contentType: "application/json; charset=utf-8", 
		dataType: "json", 
		url: session['context']+'/seedrices/findSeedRiceById',
		data:{id:idSeedRiceEdit},  
		async: false 
	}).responseJSON;

	$("#seedRiceCodeEdit").val(dataSeedriceEdit.seedRiceCode);
	$("#seedRiceCodeEdit").focus();
	$("#seedRiceNameEdit").val(dataSeedriceEdit.seedRiceName);
	$("#seedRiceNameEdit").focus();
}

$("#btnSaveEdit").on('click',function(){
	var seedRiceCodeEdit = $("#seedRiceCodeEdit").val()
	var seedRiceNameEdit = $("#seedRiceNameEdit").val()
	var data = {
		seedRiceCode : seedRiceCodeEdit,
		seedRiceName : seedRiceNameEdit,
		version : versionSeedRiceEdit
	}
	editData(data);
})

function editData(data){
	var jsonDataEdit = $.ajax({
        type: "PUT",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        headers: {
            Accept: "application/json"
        },
        url: session['context'] + '/seedrices/'+idSeedRiceEdit,
        data: JSON.stringify(data),
        complete: function (xhr) {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                	swal({
			            title: Message.Success,
			            type: 'success'
			        });
			        loadData();
					$("#modalAddSeedRiceEdit").closeModal();
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

function checkBox() {
	var countInputChecked = $("input[name='checkBoxSeedRice']:checked:enabled").length;
	var countInputAll  = $("[name='checkBoxSeedRice']").length;
	if(countInputChecked == countInputAll){
		$("#checkBoxAll").prop("checked",true);
	}else{
		$("#checkBoxAll").prop("checked",false);	
	}
};

$("#checkBoxAll").on('change',function(){
	var booleanCheckAll = $("#checkBoxAll").prop("checked");
	if(booleanCheckAll){
		$("[name='checkBoxSeedRice']").prop("checked",true);
	}else{
		$("[name='checkBoxSeedRice']").prop("checked",false);
	}
});

function clearData(){
	$("#seedRiceCode").val("");
	$("#seedRiceName").val("");
};

$("#btnAddSeedRice").on('click',function(){
	$("#modalAddSeedRice").openModal();
	clearData();
});

$("#btnSave").on('click',function(){
	var check = 0;
	var codeSeedRice = $("#seedRiceCode").val();
	var nameSeedRice = $("#seedRiceName").val();
	var data = {
		seedRiceCode : codeSeedRice,
		seedRiceName : nameSeedRice,
		version : 0
	}
	saveData(check,data);
});

$("#btnNext").on('click',function(){
	var check = 1;
	var codeSeedRice = $("#seedRiceCode").val();
	var nameSeedRice = $("#seedRiceName").val();
	var data = {
		seedRiceCode : codeSeedRice,
		seedRiceName : nameSeedRice,
		version : 0
	}
	saveData(check,data);
});

function saveData(check,data){
	var jsonDataSave = $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        headers: {
            Accept: "application/json"
        },
        url: session['context'] + '/seedrices',
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
						$("#modalAddSeedRice").closeModal();
					}
					clearData();
					loadData();
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
};


$("#btnDeleteSeedRice").on('click',function(){
	var countDelete = $("input[name='checkBoxSeedRice']:checked:enabled").length;
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
			for(var i = 0; i < $("[name='checkBoxSeedRice']").length; i++) {
		        if ($("[name='checkBoxSeedRice']")[i].checked == true) {
		            var id = $("[name='checkBoxSeedRice']")[i].getAttribute('id')
		            var data = $.ajax({
		                type: "DELETE",
		                contentType: "application/json; charset=utf-8",
		                dataType: "json",
		                headers: {
		                    Accept: "application/json"
		                },
		                url:session['context']+"/seedrices/"+id,
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
		      	loadData()
		    );
		});
	}
});



