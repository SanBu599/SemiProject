package util;

public class AnnouncementUtil {
	
	public static String titleDot(String title) {
		String newTitle;
		
		if(title.length() > 30) {
			newTitle = title.trim().substring(0, 30);
			newTitle += "...";
		}else {
			newTitle = title.trim();
		}	
		
		return newTitle;
	}
}
