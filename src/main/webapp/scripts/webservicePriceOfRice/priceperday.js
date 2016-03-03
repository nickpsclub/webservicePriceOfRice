  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });

$("#btnAddSeedRice").on('click',function(){
	var date = new Date($("#datepicker").val())

	var datesave = date.getTime()
	var dateCode = datesave+""

	saveDate(dateCode)
	})

function saveDate(dateCode){
	var dataSeedriceEdit = $.ajax({ 
		type: "GET", headers: { Accept: 'application/json' }, 
		contentType: "application/json; charset=utf-8", 
		dataType: "json", 
		url: session['context']+'/dateprices/saveData',
		data:{
			dateCode:dateCode,
			dateOfPrice:dateCode
			},
		complete: function(xhr){
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
						swal({
				            title: Message.Success,
				            type: 'success',
				            confirmButtonText: Message.OK
				        });
						$("#modalAddSeedRice").closeModal();	
					// clearData();
					// loadData();
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
	}).responseJSON;
}
