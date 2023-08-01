package org.blurbird.service.info;

import java.util.List;

import org.blurbird.domain.bank.BusinessVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.mapper.InfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private InfoMapper mapper;

	@Override
	public List<BusinessVO> getListBusiness() {
			log.info("수임사 목록 가져오기");
		return mapper.getListBusiness();
	}

	@Override
	public IncomeSVO getTotalSales() {
			log.info("총 매출 찍어내기");
			IncomeSVO vo = new IncomeSVO();
			vo.setSalesfromautoslip(mapper.getSalesfromAuto().getSalesfromautoslip());
			vo.setSalesfrombankslip(mapper.getSalesfromBank().getSalesfrombankslip());
			vo.setTotalsales(mapper.getSalesfromAuto().getSalesfromautoslip() + mapper.getSalesfromBank().getSalesfrombankslip());
			
		return vo;
	}
	
	

}
