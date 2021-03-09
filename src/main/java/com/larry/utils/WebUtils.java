package com.larry.utils;

/**
 * @author larry
 * @create 2021-03-03 14:45
 */
public class WebUtils {
    public static int parseInt(String strInt, int defauleVal) {
        int i = defauleVal;
        try {
            i = Integer.parseInt(strInt);
        } catch (NumberFormatException e) {

        }
        return i;
    }
}
