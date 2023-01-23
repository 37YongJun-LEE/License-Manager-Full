package egovframework.com.cmm.service;

/**
 *  Class Name : Globals.java
 *  Description : 시스템 구동 시 프로퍼티를 통해 사용될 전역변수를 정의한다.
 *  Modification Information
 *
 *     수정일         수정자                   수정내용
 *   -------    --------    ---------------------------
 *   2009.01.19    박지욱          최초 생성
 *
 *  @author 공통 서비스 개발팀 박지욱
 *  @since 2009. 01. 19
 *  @version 1.0
 *  @see
 *
 */

public class Globals {
	//OS 유형
    public static final String OS_TYPE = EgovProperties.getProperty("Globals.OsType");
    //DB 유형
    public static final String DB_TYPE = EgovProperties.getProperty("Globals.DbType");
    //메인 페이지
    public static final String MAIN_PAGE = EgovProperties.getProperty("Globals.MainPage");
    //ShellFile 경로
    public static final String SHELL_FILE_PATH = EgovProperties.getPathProperty("Globals.ShellFilePath");
    //퍼로퍼티 파일 위치
    public static final String CONF_PATH = EgovProperties.getPathProperty("Globals.ConfPath");
    //Server정보 프로퍼티 위치
    public static final String SERVER_CONF_PATH = EgovProperties.getPathProperty("Globals.ServerConfPath");
    //Client정보 프로퍼티 위치
    public static final String CLIENT_CONF_PATH = EgovProperties.getPathProperty("Globals.ClientConfPath");
    //파일포맷 정보 프로퍼티 위치
    public static final String FILE_FORMAT_PATH = EgovProperties.getPathProperty("Globals.FileFormatPath");

    //파일 업로드 원 파일명
	public static final String ORIGIN_FILE_NM = "originalFileName";
	//파일 확장자
	public static final String FILE_EXT = "fileExtension";
	//파일크기
	public static final String FILE_SIZE = "fileSize";
	//업로드된 파일명
	public static final String UPLOAD_FILE_NM = "uploadFileName";
	//파일경로
	public static final String FILE_PATH = "filePath";

	//사이트 코드
	public static final String SITE_DIV = EgovProperties.getProperty("Site.div");
	//통합멤버십 URL
	public static final String MEMBERSHIP_URL = EgovProperties.getProperty("Member.ship.url");

	//GNB LINK URL(한국임상시험산업본부)
	public static final String GNB_LINK_KO = EgovProperties.getProperty("Gnb.link.KO");
	//GNB LINK URL(KIIS)
	public static final String GNB_LINK_KI = EgovProperties.getProperty("Gnb.link.KI");
	//GNB LINK URL(교육관리시스템)
	public static final String GNB_LINK_KL = EgovProperties.getProperty("Gnb.link.KL");
	//GNB LINK URL(한국임상시험포털)
	public static final String GNB_LINK_KC = EgovProperties.getProperty("Gnb.link.KC");

	//메일발송요청 XML파일경로
	public static final String MAIL_REQUEST_PATH = EgovProperties.getPathProperty("Globals.MailRequestPath");
	//메일발송응답 XML파일경로
	public static final String MAIL_RESPONSE_PATH = EgovProperties.getPathProperty("Globals.MailRResponsePath");

	// G4C 연결용 IP (localhost)
	public static final String LOCAL_IP = EgovProperties.getProperty("Globals.LocalIp");



}
