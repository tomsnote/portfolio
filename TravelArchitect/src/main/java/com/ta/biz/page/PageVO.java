package com.ta.biz.page;

import lombok.Data;

@Data
public class PageVO {

	private int listSize = 5;		// 초기값으로 목록 개수를 5으로 셋팅
	private int rangeSize = 5;		// 초기값으로 페이지범위를 5으로 셋팅
	private int page; 				// 현재 페이지
	private int range;				// 각 페이지 범위 시작 번호
	private int listCnt;			// 전체 게시물의 수
	private int pageCnt;			// 전체 페이지 범위의 개수
	private int startPage;			//
	private int startList;			// 각 페이지 범위 시작 번호
	private int endPage;			// 각 페이지 범위 끝 번호
	private boolean prev;
	private boolean next;
	
	public void pageInfo(int page, int range, int listCnt) {
		this.page=page;
		this.range=range;
		this.listCnt=listCnt;
		
		// 전체 페이지 수
		this.pageCnt=(int) Math.ceil((double)listCnt/listSize);
		
		// 시작 페이지
		this.startPage = (range-1) * rangeSize + 1;
		
		// 끝 페이지
		this.endPage = range * rangeSize;
		
		// 게시판 시작번호
		this.startList = (page-1)*listSize+1;
		
		// 이전 버튼 상태
		this.prev = range == 1? false: true;
		
		// 다음 버튼 상태
		this.next = endPage >= pageCnt ? false: true;
		if(this.endPage> this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		
	}
}
