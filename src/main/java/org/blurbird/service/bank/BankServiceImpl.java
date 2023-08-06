package org.blurbird.service.bank;

import java.util.ArrayList;
import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.BhMessageVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.KeywordDTO;
import org.blurbird.domain.bank.TotalDTO;
import org.blurbird.domain.common.BusinessVO;
import org.blurbird.mapper.BankMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
@Log4j
public class BankServiceImpl implements BankService {

	public BankMapper mapper;
	
	// 통장내역 전체조회
	@Override
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search) {
		return mapper.getBankHistoryList(search);
	}

	// 통장내역 미연결 조회
	@Override
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search) {
		return mapper.getBankHistoryListNone(search);
	}

	// 통장내역 연결 조회
	@Override
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search) {
		return mapper.getBankHistoryListConn(search);
	}

	// 전표 전체 리스트 조회
	@Override
	public List<BankSlipVO> getBankSlipList(BankSearchDTO search) {
		return mapper.getBankSlipList(search);
	}

	// 전표 상태별 조회
	@Override
	public List<BankSlipVO> getBankSlipListState(BankSearchDTO search) {
		return mapper.getBankSlipListState(search);
	}
	
	// 예상 잔액, 차액 조회
	@Override
	public TotalDTO getTotalSum() {
		return mapper.getTotalSum();
	}

	// 분개내역 조회
	@Override
	public List<DetailSlipVO> getDetailSlip(String bhno) {
		return mapper.getDetailSlip(bhno);
	}
	
	// 분개내역 수정
	@Override
	public int modifySlip(DetailSlipVO detailSlip) {
		return mapper.modifySlip(detailSlip);
	}

	// 전표 상태별 개수
	@Override
	public int allSlipCount() {
		return mapper.allSlipCount();
	}

	@Override
	public int canSlipCount() {
		return mapper.canSlipCount();
	}

	@Override
	public int confirmSlipCount() {
		return mapper.confirmSlipCount();
	}

	@Override
	public int exceptSlipCount() {
		return mapper.exceptSlipCount();
	}

	@Override
	public int removeSlipCount() {
		return mapper.removeSlipCount();
	}

	// 전표 상태 수정
	@Override
	public boolean modifySlipState(String bhno, String bhstateno) {
		return mapper.modifySlipState(bhno, bhstateno)==1;
	}

	// 원하는 통장내역 조회
	@Override
	public List<BankHistoryVO> getBankHistoryDetail(List<String> bhnos) {
	    return mapper.getBankHistoryDetail(bhnos);
	}

	// 분개전표 등록
	@Override
	public void registerDetailSlip(DetailSlipVO detailSlip) {
		mapper.registerSlip(detailSlip);
	}
	
	// 메시지 요청 시 등록
	@Override
	public void registerMessage(String bhno, String message, String receiver, String sender) {
		mapper.registerMesasge(bhno, message, receiver, sender);
	}

	// 메모 수정
	@Override
	public int modifymemo(String bhno, String memo) {
		return mapper.modifymemo(bhno, memo);
	}
	
	// 키워드 전체 조회
	@Override
	public List<KeywordDTO> getListKeyword() {
		return mapper.getListKeyword();
	}

	// 차변 입력
	@Override
	public void registerDebt(String bhno, String accountno, int amount) {
		mapper.registerDebt(bhno, accountno, amount);
	}
	
	// 대변 입력
	@Override
	public void registerCredit(String bhno, String accountno, int amount) {
		mapper.registerCredit(bhno, accountno, amount);
	}

	// 확인 안한 메시지 개수
	@Override
	public int uncheckedMessageCount(String receiver) {
		return mapper.uncheckedMessageCount(receiver);
	}

	// 메시지 전체 리스트
	@Override
	public List<BhMessageVO> getListMessage(String receiver) {
		return mapper.getListMessage(receiver);
	}

	// 메시지에서 통장내역 가져오기
	@Override
	public BankHistoryVO getBhFromMessage(String messageno) {
		return mapper.getBhFromMessage(messageno);
	}

	// 메시지 읽음처리
	@Override
	public int modifyMessageState(String messageno) {
		return mapper.modifyMessageState(messageno);
	}
	
	// 수임사에서 통장내역에 대한 메모 입력시 트랜잭션 처리
	@Transactional
	@Override
	public void insertMemoForBH(String bhno, String amountwithcommas, String memo) {
		// amount -> 쉼표 없애고 int로 변환
    	int amount = Integer.parseInt(amountwithcommas.replace(",", ""));
    	
    	// 1. 통장내역에 메모 넣어 수정
		mapper.modifymemo(bhno, memo);
		
		// 2. 키워드 조회, 메모와 비교해 가져올 수 있는 계정 확인
    	List<KeywordDTO> keywordlist = mapper.getListKeyword();
    	String accountno = null;
    	
    	for(KeywordDTO keyword:keywordlist) {
    		if(keyword.getKeywordname().equals(memo)){
    			accountno = keyword.getAccountno(); // 일치하는 것 하나 찾으면 넣어주기
    		}
    	}
    	
    	// 3. 입력받은 메모와 키워드가 일치한다면 해당 계정 적용되어 자동 분개, 확정가능 전표로 등록
    	if(!accountno.equals(null)){
    		
    		// bhno로 입금인지 출금인지 조회
    		List<String> bhnos = new ArrayList<String>();
    		String sortno = "";
    		
    		bhnos.add(bhno);
    		
    		List<BankHistoryVO> bankhistory = mapper.getBankHistoryDetail(bhnos);
    		
    		for(BankHistoryVO bankVO : bankhistory) {
    			sortno = bankVO.getSortno();
    		}

    		if(sortno.equals("1")){
    			// 입금인 경우 차변 보통예금, 대변 해당하는 키워드에 맞는 계정코드
    			String debtaccountno = "103";
    			String creditaccountno = accountno;
    			
    			mapper.registerDebt(bhno, debtaccountno, amount);
    			mapper.registerCredit(bhno, creditaccountno, amount);
    		}else{
    			// 출금인 경우 차변 키워드에 맞는 계정코드, 대변 보통예금
    			String debtaccountno = accountno;
    			String creditaccountno = "103";
    			
    			mapper.registerDebt(bhno, debtaccountno, amount);
    			mapper.registerCredit(bhno, creditaccountno, amount);
    		}
    		
    		// 통장내역 확정 가능 상태로 변경
    		String bhstateno = "1001";
    		mapper.modifySlipState(bhno, bhstateno);
    	}
		
	}

}
