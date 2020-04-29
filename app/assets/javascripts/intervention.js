$(document).ready(function() {
    // console.log("Inside the script.")

    $("#intervention_building_id").prop("disabled", true);
    $("#intervention_battery_id").prop("disabled", true);
    $("#intervention_column_id").prop("disabled", true);
    $("#intervention_elevator_id").prop("disabled", true);

    // LIST RELATED BUILDINGS TO CUSTOMERS
    $("#intervention_customer_id").change(function(){
        // console.log("Inside the customer_id change function.")

        var customer = $(this).val();
        if(customer == ''){
            $("#intervention_building_id").prop("disabled", true);
        }else{
            $("#intervention_building_id").prop("disabled", false);
        }
        $.ajax({
            url: "/interventions",
            method: "GET",  
            dataType: "json",
            data: {customer: customer},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var buildings = response["buildings"];
                $("#intervention_building_id").empty();

                $("#intervention_building_id").append('<option>Select Building</option>');
                // $("#intervention_building_id").append('<option value = "" >None</option>');
                for(var i = 0; i < buildings.length; i++){
                    $("#intervention_building_id").append('<option value="' + buildings[i]["id"] + '">' +buildings[i]["id"] + '</option>');
                }
            }
        });
    });
    

    // LIST RELATED BATTERIES TO BUILDINGS
    $("#intervention_building_id").change(function(){
        // console.log("Inside the building_id change function.")

        var building = $(this).val();
        if(building == ''){
            $("#intervention_battery_id").prop("disabled", true);
        }else{
            $("#intervention_battery_id").prop("disabled", false);
        }
        $.ajax({
            url: "/interventions",
            method: "GET",  
            dataType: "json",
            data: {building: building},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var batteries = response["batteries"];
                $("#intervention_battery_id").empty();

                $("#intervention_battery_id").append('<option>Select Battery</option>');
                for(var i = 0; i < batteries.length; i++){
                    $("#intervention_battery_id").append('<option value="' + batteries[i]["id"] + '">' + batteries[i]["id"] + '</option>');
                }
            }
        });
    });

    // LIST RELATED COLUMNS TO BATTERIES
    $("#intervention_battery_id").change(function(){
        // console.log("Inside the battery_id change function.")

        var battery = $(this).val();
        if(battery == ''){
            $("#intervention_column_id").prop("disabled", true);
        }else{
            $("#intervention_column_id").prop("disabled", false);
        }
        $.ajax({
            url: "/interventions",
            method: "GET",  
            dataType: "json",
            data: {battery: battery},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var columns = response["columns"];
                $("#intervention_column_id").empty();

                $("#intervention_column_id").append('<option value="">None</option>');
                for(var i = 0; i < columns.length; i++){
                    $("#intervention_column_id").append('<option value="' + columns[i]["id"] + '">' + columns[i]["id"] + '</option>');
                }
            }
        });
    });

    // LIST RELATED ELEVATORS TO COLUMNS
    $("#intervention_column_id").change(function(){
        // console.log("Inside the column_id change function.")

        var column = $(this).val();
        if(column == ''){
            $("#intervention_elevator_id").prop("disabled", true);
        }else{
            $("#intervention_elevator_id").prop("disabled", false);
        }
        $.ajax({
            url: "/interventions",
            method: "GET",  
            dataType: "json",
            data: {column: column},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var elevators = response["elevators"];
                $("#intervention_elevator_id").empty();

                $("#intervention_elevator_id").append('<option value="">None</option>');
                for(var i = 0; i < elevators.length; i++){
                    $("#intervention_elevator_id").append('<option value="' + elevators[i]["id"] + '">' + elevators[i]["id"] + '</option>');
                }
            }
        });
    });
});
