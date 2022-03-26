package Model;

public class T_SensorDTO {


private String sensor_type;	
private String sensor_unit;	
private String sensor_inst_date;
private String[] array_sensor_type;
private String[] array_sensor_unit;
private String[] array_sensor_inst_date;

public T_SensorDTO(String[] array_sensor_type, String[] array_sensor_unit, String[] array_sensor_inst_date) {
	super();
	this.array_sensor_type = array_sensor_type;
	this.array_sensor_unit = array_sensor_unit;
	this.array_sensor_inst_date = array_sensor_inst_date;
}

public T_SensorDTO(String sensor_type, String sensor_unit, String sensor_inst_date) {
	super();
	this.sensor_type = sensor_type;
	this.sensor_unit = sensor_unit;
	this.sensor_inst_date = sensor_inst_date;
}

public String getSensor_type() {
	return sensor_type;
}

public void setSensor_type(String sensor_type) {
	this.sensor_type = sensor_type;
}

public String getSensor_unit() {
	return sensor_unit;
}

public void setSensor_unit(String sensor_unit) {
	this.sensor_unit = sensor_unit;
}

public String getSensor_inst_date() {
	return sensor_inst_date;
}

public void setSensor_inst_date(String sensor_inst_date) {
	this.sensor_inst_date = sensor_inst_date;
}

public String[] getArray_sensor_type() {
	return array_sensor_type;
}

public void setArray_sensor_type(String[] array_sensor_type) {
	this.array_sensor_type = array_sensor_type;
}

public String[] getArray_sensor_unit() {
	return array_sensor_unit;
}

public void setArray_sensor_unit(String[] array_sensor_unit) {
	this.array_sensor_unit = array_sensor_unit;
}

public String[] getArray_sensor_inst_date() {
	return array_sensor_inst_date;
}

public void setArray_sensor_inst_date(String[] array_sensor_inst_date) {
	this.array_sensor_inst_date = array_sensor_inst_date;
}


	


}
