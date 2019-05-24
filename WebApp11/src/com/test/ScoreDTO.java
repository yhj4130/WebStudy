package com.test;

public class ScoreDTO
{
	String name, SID;
	int kor, eng, mat,tot;
	double avg;

	public int getTot()
	{
		return tot;
	}

	public void setTot(int tot)
	{
		this.tot = tot;
	}

	public double getAvg()
	{
		return avg;
	}

	public void setAvg(double avg)
	{
		this.avg = avg;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getSID()
	{
		return SID;
	}

	public void setSID(String sID)
	{
		SID = sID;
	}

	public int getKor()
	{
		return kor;
	}

	public void setKor(int kor)
	{
		this.kor = kor;
	}

	public int getEng()
	{
		return eng;
	}

	public void setEng(int eng)
	{
		this.eng = eng;
	}

	public int getMat()
	{
		return mat;
	}

	public void setMat(int mat)
	{
		this.mat = mat;
	}

	
}
