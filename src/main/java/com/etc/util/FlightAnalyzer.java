package com.etc.util;


import java.io.*;
import java.util.*;


public class FlightAnalyzer {

//	调用py
//    ['-2124880537.0' '67810.0' '2020697.0' '-6.0' '1.0' '0.0']
//    -2124880537.0 67810.0 2020697.0 -6.0 1.0 0.0 f
//    -1756301630,68178,1987024,28,0,1,1 t
	public static double toPython(String flight,String dst,String model,String temperature,String weather,String sight) throws Exception {
	    //AirlineAndWeather aaw=new AirlineAndWeather(new Text("ZM6212,BFJ,A320,-6,轻雾,false,4,1,6,true"));
        String filePath = new File("").getCanonicalPath();
        String exe = "python";
//        System.out.println(command);
//        System.out.println("[Source] " + command);
        String p1,p2,p3,p4,p5,p6;

        p1=flight.hashCode()+"";
        p2=dst.hashCode()+"";
        p3=model.hashCode()+"";

//        p1="-1756301630.0";
//        p2="68178.0";
//        p3="1987024.0";
//        p4="28.0";
//        p5="0.0";
//        p6="1.0";
        String[] cmdW = new String[] {exe, filePath+"\\src\\main\\java\\data\\request.py"};
        Process process = Runtime.getRuntime().exec(cmdW);
        InputStream is = process.getInputStream();
        DataInputStream dis = new DataInputStream(is);
        String str=dis.readLine();
        String[] infos = str.split(" ");
        p4=(temperature==""?infos[0]:temperature);
        p5=(weather==""?infos[1]:weather);
        p6=(sight==""?infos[2]:sight);

        String[] cmdT = new String[] {exe, filePath+"\\src\\main\\java\\data\\pred.py", p1, p2, p3, p4, p5, p6};
        process = Runtime.getRuntime().exec(cmdT);
        is = process.getInputStream();
        dis = new DataInputStream(is);
        str = dis.readLine();

//        String tmp=dis.readLine();
//        while(tmp!=null)
//        {
//            str+=tmp+"\n";
//            tmp=dis.readLine();
//        }

        process.waitFor();
        //System.out.println("[Result] "+str);//[0,1]->[p0,p1]
        return Double.parseDouble(str);
    }
}