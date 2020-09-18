package com.github.saintukrainian.webdatabasedemo.helper;

public class HelperClass {
    private Object item;
    private static HelperClass helper;


    private HelperClass() {

    }

    public static HelperClass getHelper() {
        if (helper == null) {
            helper = new HelperClass();
        }
        return helper;
    }

    public void setItem(Object item) {
        this.item = item;
    }

    public Object getItem() {
        return item;
    }
}
