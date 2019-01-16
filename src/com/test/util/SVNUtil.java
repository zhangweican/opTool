package com.test.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.tmatesoft.svn.core.SVNDirEntry;
import org.tmatesoft.svn.core.SVNException;
import org.tmatesoft.svn.core.SVNURL;
import org.tmatesoft.svn.core.auth.ISVNAuthenticationManager;
import org.tmatesoft.svn.core.io.SVNRepository;
import org.tmatesoft.svn.core.io.SVNRepositoryFactory;
import org.tmatesoft.svn.core.wc.SVNWCUtil;

public class SVNUtil {
	
	public static SVNRepository getConnection(){
		String url = "http://172.28.17.231/svn/System/Development/IDC/branches/";  
		String name = "zhangwc";  
		String password = "21ops.com";  
		  
		SVNRepository repository = null;  
		try {  
		    repository = SVNRepositoryFactory.create( SVNURL.parseURIDecoded( url ) );  
		    ISVNAuthenticationManager authManager = SVNWCUtil.createDefaultAuthenticationManager( name , password );  
		    repository.setAuthenticationManager( authManager );  
		} catch (SVNException svne ) {  
		    //handle exception  
		}  
		return repository;
	} 
	
	public static List<String> listEntries( SVNRepository repository, String path ) throws SVNException { 
		List<String> list = new ArrayList<String>();
	    Collection entries = repository.getDir( path, -1 , null , (Collection) null );  
	    Iterator iterator = entries.iterator( );  
	    while ( iterator.hasNext( ) ) {  
	        SVNDirEntry entry = ( SVNDirEntry ) iterator.next( );  
	        list.add(entry.getName());
	        System.out.println( entry.getName());  
	    }  
	    return list;
	} 
	public static void main(String[] args) {
		try {
			SVNUtil.listEntries(SVNUtil.getConnection(), "/Development/IDC/branches/");
		} catch (SVNException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
