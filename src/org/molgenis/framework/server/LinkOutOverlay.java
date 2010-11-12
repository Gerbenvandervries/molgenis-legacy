package org.molgenis.framework.server;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LinkOutOverlay
{

	Map<String,String> mypatterns = new HashMap<String, String>();
	
	LinkOutOverlay(){
		mypatterns.put("K[0-9]{5}", "http://www.genome.jp/dbget-bin/www_bget?");
		mypatterns.put("LOC[0-9]{6}", "http://www.ncbi.nlm.nih.gov/gene?term=");
		mypatterns.put("N[CGTW]{1}_[0-9]{6}.[0-9]+", "http://www.ncbi.nlm.nih.gov/sites/gquery?term=");
		mypatterns.put("AC_[0-9]{6}.[0-9]+", "http://www.ncbi.nlm.nih.gov/sites/gquery?term=");
		mypatterns.put("AC[0-9]{6}.[0-9]+", "http://www.ncbi.nlm.nih.gov/sites/gquery?term=");
		mypatterns.put("A[tT][0-9]{1}[gG][0-9]{4,6}", "http://www.arabidopsis.org/servlets/Search?type=general&search_action=detail&method=1&show_obsolete=F&sub_type=gene&SEARCH_EXACT=4&SEARCH_CONTAINS=1&name=");
	
		mypatterns.put("WBGene[0-9]+", "http://www.wormbase.org/db/gene/gene?class=Gene&name=");
	}
	
	String addlinkouts(String in){
		String out = in;
		for (String key : this.mypatterns.keySet()) { 
			StringBuffer sb = new StringBuffer();
			//System.out.println(key + ".\n");
			Pattern pattern = Pattern.compile(key);
			Matcher matcher = pattern.matcher(out);
			
			while (matcher.find()) {
				//System.out.println( matcher.group() + " at index "+matcher.start()+" and ending at index "+matcher.end()+".\n");
				matcher.appendReplacement(sb, "\n<a href="+mypatterns.get(key)+matcher.group()+ ">" + matcher.group() + "</a>");
			}
			matcher.appendTail(sb);
			out = sb.toString();
		}
		return out;
	}
	
}
