package egovframework.com.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스
 *
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public void initVariables() {
		firstPageLabel    = "<a href=\"?pageIndex={1}\" class=\"prev_next\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() + "/_img/adm/comn/pn_first.png\" alt=\"처음\"/></a>&#160;";
        previousPageLabel = "<a href=\"?pageIndex={1}\" class=\"prev_next\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() + "/_img//adm/comn/pn_prev.png\" alt=\"이전\" /></a>&#160;";
        currentPageLabel  = "<a href=\"#\" class=\"on\">{0}</a>&#160;";
        otherPageLabel    = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false;\">{2}</a>&#160;";
        nextPageLabel     = "<a href=\"?pageIndex={1}\" class=\"prev_next\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() + "/_img/adm/comn/pn_next.png\" alt=\"다음\"/></a>&#160;";
        lastPageLabel     = "<a href=\"?pageIndex={1}\" class=\"prev_next\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() + "/_img/adm/comn/pn_last.png\" alt=\"마지막\"/></a>&#160;";
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
}
