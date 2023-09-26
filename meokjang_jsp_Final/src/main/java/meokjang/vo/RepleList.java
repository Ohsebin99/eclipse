package meokjang.vo;

import java.util.ArrayList;

public class RepleList {
	ArrayList<RepleVO> list = new ArrayList<>();

	public ArrayList<RepleVO> getList() {
		return list;
	}

	public void setList(ArrayList<RepleVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "RepleList [list=" + list + "]";
	}
}
