package org.blurbird.service.receipt;

import java.util.List;

import org.blurbird.domain.receipt.AccountVO;
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
	public AccountVO read(String AcocuntNo) {
		log.info("read.....");
		return mapper.getAccountName(AcocuntNo);
	}

	@Override
	public List<AccountVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}
}