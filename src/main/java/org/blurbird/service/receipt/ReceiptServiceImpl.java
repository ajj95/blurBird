package org.blurbird.service.receipt;

import java.sql.Date;
import java.util.List;

import org.blurbird.domain.receipt.AccountVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;
import org.blurbird.mapper.ReceiptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReceiptServiceImpl implements ReceiptService {
	
	@Autowired
	private ReceiptMapper mapper;
	
	@Override
	public List<AccountVO> getAccountList() {
		log.info("getAccountList.....");
		return mapper.getAccountList();
	}

	@Override
	public List<ReceiptRequestVO> getReceiptList(DateRange dateRange) {
		log.info("getReceiptList....");
		return mapper.getReceiptList(dateRange);
	}
}