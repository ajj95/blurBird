package org.blurbird.domain.info;

import lombok.Data;

@Data
public class InfoData {

	private String bizno;
	private String year;
	@Override
	public String toString() {
		return "InfoData [bizno=" + bizno + ", year=" + year + "]";
	}
	
	
}
