package org.blurbird.domain.info;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
public class InfoMainVO {

		private String bizno;
		private String bizname;
		private String year;
		private String bizincome;
		private String tax;
		private String reportdate;
		private String reportdoc;
		private String paymentslip;
		private String transdate;
		private String status;
		
}
