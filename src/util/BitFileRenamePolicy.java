package util;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class BitFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File oriFile) {
		// abc.jpg
		// c:/2016/08/11/abc.jpg
		String name = oriFile.getName();
		// c:/2016/08/11
		String parent = oriFile.getParent();
		String ext="";
		// index = 3 
		int index = name.lastIndexOf(".");
		if(index != -1){
			// ext = ".jpg"
			ext = name.substring(index);
		}
		String uName = UUID.randomUUID().toString();
			//			  (경로, 파일명+확장명)
		return new File(parent, uName+ext);
	}
}
