$(document).ready(function() {
  $('form.fetch_meetup').submit(function(event) {
    event.preventDefault();
    var url = $('form.fetch_meetup input#url').val();
    $('.fetch_meetup').hide();
    loadingThingy();
    fetchMeetup(url);
  });

  function fetchMeetup(url) {
    var url = url.split('/');
    if (url[url.length-1] === "") {
      var id = url[url.length-2];
    }
    else {
      var id = url[url.length-2];
    }
    var api_key = "50126113187c612be767a33451ac";
    $.ajax({
      url: 'https://api.meetup.com/2/event/' + id + '?key=' + api_key + '&sign=true',
      crossDomain: true,
      dataType: 'jsonp',
      type: "GET",
      success: function dataSuccess(data) {
        populateForm(data, id);
        },
      error: function(data) {
        console.log("OH NOEEESSS! SOMETHING WENT WRONG!", data);
      }
    });
  }

  function populateForm(data, id) {
    var date = dateFromSecondsSinceEpoch(data.time);
    var day = date.getDate();

    // START TIME
    var startHour = date.getHours();
    if (startHour < 10) {
      startHour = '0' + startHour;
    }
    var startMins = date.getMinutes();
    if (startMins < 10) {
      startMins = '0' + startMins;
    }

    // END TIME
    var mins = parseInt(data.duration) / 1000 / 60;
    var minutes = mins % 60;
    if (minutes < 10) {
      minutes = '0' + minutes;
    }
    else if (minutes == null) {
      minutes = '00';
    }
    var length = mins / 60;
    var hours = parseInt(startHour) + parseInt(length);
    if (hours < 10) {
      hours = '0' + hours;
    }

    $('#course_name').val(data.name);
    $('#course_url').val(data.event_url);
    $('#course_location').val(data.venue.name + ' ' + data.venue.address_1);
    $('#course_description').val(data.description);
    $('#course_date_1i').val('2014');
    $('#course_date_2i').val(date.getMonth() + 1); // January
    $('#course_date_3i').val(day); // 1-31
    $('#course_start_time_4i').val(startHour);
    $('#course_start_time_5i').val(startMins);
    $('#course_end_time_4i').val(hours);
    $('#course_end_time_5i').val(minutes);
    $('#course_meetup_id').val(id);
    $('.loading').remove();
  }

  function dateFromSecondsSinceEpoch(secs) {
    var date = new Date(0);
    date.setUTCMilliseconds(secs);
    return date;
  }

  function prettyMonth(num) {
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    return months[num];
  }

  function loadingThingy() {
    $('.loading').append('<img src="/images/loading.gif">');
  }
});
