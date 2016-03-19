  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });


var id = window.location.search.replace('?','').split('&')[0].split('=')[1];
if(id == undefined || id == "en" || id == "th"){
	loadData("",1)	
}else{
	loadData(id,0)
}

function searchDate(){

	var date = new Date($("#datepicker").val())

	if($("#datepicker").val() == ""){
		$('#datepicker').popover('show')
		setTimeout(function () { 
			$('#datepicker').popover('hide'); 
		}, 2000);
	}else{
		var datesave = date.getTime()
		var dateCode = datesave+""
		saveDate(dateCode)
	}
	
}

function saveDate(dateCode){
	var findDuplicateByCodeDate = $.ajax({ 
		type: "GET", headers: { Accept: 'application/json' }, 
		contentType: "application/json; charset=utf-8", 
		dataType: "json", 
		url: session['context']+'/dateprices/findDuplicateByCodeDate',
		data:{
			codeDate:dateCode
			},
		async: false 
		}).responseJSON;

	if(findDuplicateByCodeDate == null){
		swal({
		    title: "ข้อมูลนี้ยังไม่ถูกบันทึกในระบบ",
		    text: "คุณต้องการบันทึกใช่หรือไม่",
		    type: 'warning',
		    confirmButtonColor: '#3085d6',
		    cancelButtonColor: '#d33',
		    confirmButtonText: Message.OK,
		    closeOnConfirm: false,
		    showCancelButton: true,
		    cancelButtonText: Message.Cancel
		},
		function() {
			var dataSaveDate = $.ajax({ 
				type: "GET", headers: { Accept: 'application/json' }, 
				contentType: "application/json; charset=utf-8", 
				dataType: "json", 
				url: session['context']+'/dateprices/saveData',
				data:{
					dateOfPrice:dateCode
					},
				complete: function(xhr){
					if (xhr.readyState == 4) {
						if (xhr.status == 200) {
							swal({
					            title: Message.Success,
					            type: 'success',
					            confirmButtonText: Message.OK
					        })
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
			loadwindow(dataSaveDate.id)
		});
	}else{
		var idDate = findDuplicateByCodeDate.id;
		loadwindow(idDate)
	}
}

function loadwindow(idDate){
	window.location.href = session['context'] + '/priceperdays/priceperdayInsert?id=' + idDate;
}

function loadData(idDate,check){
	var checkBtnAddAndDelete = 0;
	if(checkBtnAddAndDelete == check){
		$("#btnAddPrice").removeClass("disabled");
		$("#btnDeletePrice").removeClass("disabled");
	}
	var dataPricePerDay = $.ajax({ 
		type: "GET", headers: { Accept: 'application/json' }, 
		contentType: "application/json; charset=utf-8", 
		dataType: "json", 
		url: session['context']+'/priceperdays/findPricePerDayByDay',
		data:{
			day:idDate
			},  
		async: false 
	}).responseJSON;

	$("#tableDataPricePerDay").empty();

	for(var i=0;i<dataPricePerDay.length;i++){
		$("#tableDataPricePerDay").append(''+
			'<tr>'+
				'<td>'+
    				'<input type="checkbox" class="filled-in" id="'+dataPricePerDay[i].id+'" value="'+dataPricePerDay[i].id+'" name="checkBoxPricePerDay" onclick="checkBox(this)"/>'+
    				'<label for="'+dataPricePerDay[i].id+'"></label>'+
				'</td>'+
				'<td>'+
					'<a class="btn-floating btn-large red" onclick="editPricePerDay(this)" idEdit="'+dataPricePerDay[i].id+'" version="'+dataPricePerDay[i].version+'">'+
      					'<i class="large material-icons">mode_edit</i>'+
    				'</a>'+
				'</td>'+
				'<td>'+
					dataPricePerDay[i].typeRice.typeRiceName+
				'</td>'+
				'<td>'+
					dataPricePerDay[i].price+
				'</td>'+
			'</tr>');
	}
}

