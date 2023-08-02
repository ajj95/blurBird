package org.blurbird.service.info;

import java.util.List;

import org.blurbird.domain.bank.BusinessVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.mapper.InfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
@NoArgsConstructor
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private InfoMapper mapper;
	
//	@Autowired
//	private IncomeSVO vo;

	@Override
	public List<BusinessVO> getListBusiness() {
			log.info("���ӻ� ��� ��������");
		return mapper.getListBusiness();
	}

//	@Override
//	public IncomeSVO getISElements() {
//		
//		long sales = mapper.getSalesfromAuto().getSalesfromautoslip() +
//		mapper.getSalesfromBank().getSalesfrombankslip();
//		
//		long cogs = mapper.getCOGSfromAuto().getCogsfromautoslip() +
//				mapper.getCOGSfromBank().getCogsfrombankslip() +
//				mapper.getCOGSfromCash().getCogsfromcashslip();
//		
//		vo.setTotalsales(sales);
//		vo.setTotalcogs(cogs);
//		
//		return vo;
//	}

	

}
