$(document).ready(function(){

  // datepciker to dutch
  	$.datepicker.regional['nl'] = {clearText: 'Effacer', clearStatus: '',
  	    closeText: 'sluiten', closeStatus: 'Onveranderd sluiten ',
  	    prevText: '<vorige', prevStatus: 'Zie de vorige maand',
  	    nextText: 'volgende>', nextStatus: 'Zie de volgende maand',
  	    currentText: 'Huidige', currentStatus: 'Bekijk de huidige maand',
  	    monthNames: ['januari','februari','maart','april','mei','juni',
  	    'juli','augustus','september','oktober','november','december'],
  	    monthNamesShort: ['jan','feb','mrt','apr','mei','jun',
  	    'jul','aug','sep','okt','nov','dec'],
  	    monthStatus: 'Bekijk een andere maand', yearStatus: 'Bekijk nog een jaar',
  	    weekHeader: 'Sm', weekStatus: '',
  	    dayNames: ['zondag','maandag','dinsdag','woensdag','donderdag','vrijdag','zaterdag'],
  	    dayNamesShort: ['zo', 'ma','di','wo','do','vr','za'],
  	    dayNamesMin: ['zo', 'ma','di','wo','do','vr','za'],
  	    dayStatus: 'Gebruik DD als de eerste dag van de week', dateStatus: 'Kies DD, MM d',
  	    dateFormat: 'dd/mm/yy', firstDay: 1, 
  	    initStatus: 'Kies een datum', isRTL: false};
  	$.datepicker.setDefaults($.datepicker.regional['nl']);

  // datepicker
  $(function() {
      $( "#datepickerInschrijving" ).datepicker({
      	// shows days of other months
      	showOtherMonths: true,
       	selectOtherMonths: true,
       	// form date to date function
       	defaultDate: "+1w",
        	changeMonth: false,
        	numberOfMonths: 1,
        	onClose: function( selectedDate ) {
          	$( "#datepickerInzending" ).datepicker( "option", "minDate", selectedDate );
        	}
      });
      $( "#datepickerInzending" ).datepicker({
      	// shows days of other months
      	showOtherMonths: true,
      	selectOtherMonths: true,
      	// form date to date function
      	defaultDate: "+1w",
        	changeMonth: false,
        	numberOfMonths: 1,
        	onClose: function( selectedDate ) {
          	$( "#datepickerInschrijving" ).datepicker( "option", "maxDate", selectedDate );
        	}
      });
  });

  // removes the values on the fields in the form
  // if the input is clicked the value is none
  $('.field > input').click(function(){
  	if ($(this).val() == 'Wedstrijd naam')  {
        $(this).val('');
    } 
  });

  $('.field > textarea').click(function(){
    if ($(this).val() == 'Geef een omschrijving')  {
      $(this).val('');
    }
  });

  $('.ui-state-default > input').click(function(){
    if ($(this).val() == 'Beschrijf de prijs') {
      $(this).val('');
    }
  });

  // removes the borderFail class by cliking on it
  $('#name').click(function(){
    $('#name').removeClass('borderFail', function(){
      $('#name > .borderFail').fadeOut(500);
    });
  });

  $('#textarea').click(function(){
    $('#textarea').removeClass('borderFail', function(){
      $('#textarea > .borderFail').fadeOut(500);
    });
  });

  $('#datepickerInschrijving').click(function(){
    $('#datepickerInschrijving').removeClass('borderFail', function(){
      $('#datepickerInschrijving > .borderFail').fadeOut(500);
    });
  });

  $('#datepickerInzending').click(function(){
    $('#datepickerInzending').removeClass('borderFail', function(){
      $('#datepickerInzending > .borderFail').fadeOut(500);
    });
  });


  $('.ui-state-default > input').click(function(){
    $(this).removeClass('borderFail', function(){
      $('.ui-state-default > input > .borderFail').fadeOut(500);
    });
  });

  // checkes for a validation in the forms. When clicked on submit
  function validateForm() {
    var inputVal = document.forms['wedstrijdForm']['name'].value;
    if ((inputVal == 'Wedstrijd naam') || (inputVal == '')) {
      $('#name').addClass('borderFail', function(){
        $('.borderFail').fadeIn(500);
      });
      return false;
    } 
    
    var textareaVal = document.forms['wedstrijdForm']['textarea'].value;  
    if ((textareaVal == 'Geef een omschrijving') || (textareaVal == '')) {
      $('#textarea').addClass('borderFail', function(){
        $('.borderFail').fadeIn(500);
      });
      return false;
    }
      
    var inschrijvingVal = document.forms['wedstrijdForm']['inschrijving'].value;
    if ((inschrijvingVal == 'Eind datum voor de inschrijving') || (inschrijvingVal == '')) {
      $('#datepickerInschrijving').addClass('borderFail', function(){
        $('.borderFail').fadeIn(500);
      });
      return false;
    }

    var inzendingVal = document.forms['wedstrijdForm']['inzending'].value;
    if ((inzendingVal == 'Eind datum voor de inzendingen') || (inzendingVal == '')) {
      $('#datepickerInzending').addClass('borderFail', function(){
        $('.borderFail').fadeIn(500);
      });
      return false;
    }

    var prise = document.getElementById('sortable');
    var priseChild = prise.getElementsByTagName('li');
    var priseChildVal = priseChild[0].childNodes[1].value;
    if ((priseChildVal == 'Beschrijf de prijs') || (priseChildVal == '')) {
      $('.ui-state-default:first-child > input').addClass('borderFail', function(){
        $('.borderFail').fadeIn(500);  
      });
      return false;
    }
    return ( true );  
  }

  // drag and drop function, for the prize order
/* 
  $(function() {
    $( "#sortable" ).sortable({
      placeholder: "ui-state-highlight"
    });
    $( "#sortable" ).disableSelection();
  });

  $('#addPrise').click(function(){
    var addPrise = $('<li class="ui-state-default"><input name="prise" type="text" value=""><div class="closetag"></div></li>').hide().fadeIn(500);
    $('#sortable').append(addPrise);

    var prise = document.getElementById('sortable');
    var priseChild = prise.getElementsByTagName('li').length;
    if (priseChild > 4) {
      $('#addPrise').fadeOut(500);
    }
  });

  $(document).on('click', '.closetag', function() {
    $(this).parent().remove();
    var prise = document.getElementById('sortable');
    var priseChild = prise.getElementsByTagName('li').length;
    if (priseChild < 5) {
      $('#addPrise').fadeIn(500);
    }
  });

  $(document).on('mouseup', '.ui-state-default', function(){
    $('.closetag').delay(1).fadeIn(function(){
      $('.ui-state-default:first-child .closetag').fadeOut();
    });
    
  });

  $('.ui-state-default:first-child .closetag').hide();
*/

});
