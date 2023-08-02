package org.blurbird.domain.receipt;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DateRange {
	private LocalDate startDate;
	private LocalDate endDate;
}
