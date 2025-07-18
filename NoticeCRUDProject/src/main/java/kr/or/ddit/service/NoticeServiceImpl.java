package kr.or.ddit.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.NoticeRetreiveController;
import kr.or.ddit.mapper.ILoginMapper;
import kr.or.ddit.vo.NoticeMemberVO;
import lombok.val;

/**
 * <pre>
 * PROJ : NoticeCRUDProject
 * Name : NoticeServiceImpl
 * DESC : 공지사항 게시판 로그인 관련/게시판 관련 클래스
 * </pre>
 * 
 * @author [대덕인재개발원/카멜케이스] lhe
 * @version 1.0, 2025.07.18
 */
@Service
public class NoticeServiceImpl implements INoticeService {

    private final NoticeRetreiveController noticeRetreiveController;
	
//	@Autowired
//	private INoticeMapper NoticeMapper;
	
	@Autowired
	private ILoginMapper loginMapper;
	
	@Value("${kr.or.ddit.upload.path}")
	private String uploadPath;


    NoticeServiceImpl(NoticeRetreiveController noticeRetreiveController) {
        this.noticeRetreiveController = noticeRetreiveController;
    }

	
	/**
	 * <p>아이디 중복 확인</p>
	 * 
	 * @date 2025.07.18
	 * @author lhe(ddit)
	 * @param memId 아이디
	 * @return SetviceResult 일치 여부에 따른 상태 (EXIST, NOTEXIST)
	 */
	@Override
	public ServiceResult idCheck(String memId) {
		ServiceResult result = null;
		NoticeMemberVO member = loginMapper.idCheck(memId);
		if(member != null) {
			result = ServiceResult.EXIST;
		} else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}
	
	
	/**
	 * <p>회원가입</p>
	 * 
	 * @date 2025.07.18
	 * @author lhe(ddit)
	 * @param memberVO 회원가입을 위한 회원정보
	 * @return SetviceResult 회원가입 후 결과 (OK, FAILED)
	 */
	@Override
	public ServiceResult signup(NoticeMemberVO memberVO) {
		
		ServiceResult result = null;
		
		// 회원가입시, 프로필 이미지로 파일을 업로드 하는데 이때 업로드 할 서버 경로로 설정한다.
		String path = uploadPath + "profile";
		File file = new File(path);
		if(!file.exists()) {
			file.mkdir();
		}
		
		String profileImg = "";	// 회원정보에 추가될 프로필 이미지 경로
		try {
			// 넘겨받은 회원정보에서 파일 데이터 가져오기
			MultipartFile profileImgFile = memberVO.getImgFile();
			
			if(profileImgFile != null && !profileImgFile.getOriginalFilename().equals("")) {
				// UUID_원본파일명으로 파일명 생성
				String fileName = UUID.randomUUID().toString() + "_" + profileImgFile.getOriginalFilename();
				
				// 완성된 path의 경로
				path += "/" + fileName;
				profileImgFile.transferTo(new File(path));	// 해당 위치에 파일 복사 (가장많이 사용하는 메서드)
				// 파일 복사가 일어난 파일의 위치로 접근하기 위한 URI 설정
				profileImg = "/upload/profile/" + fileName;
			}
			memberVO.setMemProfileimg(profileImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int status = loginMapper.signup(memberVO);
		if(status > 0) { 			// 회원가입 성공
			result = ServiceResult.OK;
		}else {						// 회원가입 실패
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	

}
