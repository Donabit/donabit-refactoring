package com.donabit.demo.challenge;

public class MoreObject {
	
	 /* 현재 페이지 */
   private int pageNum;
   
   /* 한 페이지 당 보여질 게시물 갯수 */
   private int amount;
   
   /* 스킵 할 게시물 수( (pageNum-1) * amount ) */
   private int skip;
   
   public MoreObject() {
   	this(1, 8);
   }
   
   /* 생성자 => 원하는 pageNum, 원하는 amount */
   public MoreObject(int pageNum, int amount) {
       this.pageNum = pageNum;
       this.amount = amount;
       this.skip = (pageNum - 1) * amount;
   }
   
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		
		this.skip= (pageNum-1)*this.amount;
		
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		
		this.skip= (this.pageNum-1)*amount;
		
		this.amount = amount;
	}
	
	public int getSkip() {
		return skip;
	}
	
	public void setSkip(int skip) {
		this.skip = skip;
	}

}
 