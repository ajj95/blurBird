package org.blurbird.domain.receipt;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConfirmedVO {
	private String confirmedno;
	private String recreqno;
	private Date regdate;
}
