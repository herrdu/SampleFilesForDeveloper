<%@ include file="/WEB-INF/support/XT5/pagePrelude.jspf" %>
<%@ taglib prefix="ROOT" tagdir="/WEB-INF/tags" %>
<aj:validateUser reloadAll="true" allowSidInCookie="false" skipFaceCheck="true" acceptCookieInURL="true"/>
<wm:i18n category="main" />
<c:set var="preferredSkin" value="${empty ajc.validSkin ? 'blue' : ajc.validSkin}" />
<ROOT:checkBrowser />
<c:if test="${browserName eq 'msie' && browserMajorVersion < 8}">
    <aj:exec func="user:changeFaceSettings" face="XT3" temporary="${true}">
        <aj:catch code="FA_INVALID_FACE">
            <wm:i18n category="error" var="errBundle" />
            <ROOT:messageLayout>
                <jsp:attribute name="title"><fmt:message key="sys_info" /></jsp:attribute>
                <jsp:body><fmt:message key="FA_INVALID_FACE.uaIssue" bundle="${errBundle}" /></jsp:body>
            </ROOT:messageLayout>
        </aj:catch>
    </aj:exec>
    <c:redirect url="${ajc.result.var.mainURL}" />
</c:if>
<!DOCTYPE html>
<html class="XT5-layout">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="referrer" content="origin-when-cross-origin">
    <meta name="renderer" content="webkit">
    <title><c:out value="${null}"><fmt:message key="main_title" /></c:out></title>
    <common:favicon />
    <link rel="stylesheet" href="../common/assets/4416cd1d/css/iconfont/iconfont.css" />
    <%@ include file="/bundle/XT5_style.jspf" %>
    <link class="skin-scheme ${preferredSkin}" rel="stylesheet" href="4416cd1d/style/dist/${preferredSkin}/skin.css" />
</head>
<body class="XT5-layout">
    <section class="m-layout j-layout">
        <div class="u-lmask j-layout-loading">
            <div class="u-lmask-floater"></div>
            <div class="u-lmask-content"><div class="u-lmask-loading"></div></div>
        </div>
        <aside class="lysidebar j-layout-nav">
            <div class="icon j-switch-mainpage" data-i18n="common/nav_main" i18n-target="title"><i class="iconfont iconhome"></i></div>
            <div class="avatar">
                <a href="javascript:void(0);" class="u-img u-img-round">
                    <img class="j-avatar" alt="avatar"/>
                </a>
            </div>
            <div class="divider"></div>
            <div class="j-wrapper">
                <div class="icon" data-trigger="mail" data-i18n="main/appname_MBOX" i18n-target="title">
                    <i class="iconfont iconemail"></i>
                </div>
                <c:if test="${ajc.cal.enabled}">
                    <div class="icon" data-trigger="calendar" data-i18n="main/appname_MYCAL" i18n-target="title">
                        <i class="iconfont iconschedule"></i>
                    </div>
                </c:if>
                <c:if test="${ajc.nf.enabled || ajc.nf.enfEnabled || ajc.user.enableTrs || ajc.user.COS.perm_attachment_manager}">
                    <div class="icon" data-trigger="file" data-i18n="common/nav_file" i18n-target="title">
                        <i class="iconfont iconfiler"></i>
                    </div>
                </c:if>
                <c:if test="${ajc.oab.enabled || ajc.pab.enabled}">
                    <div class="icon" data-trigger="contact" data-i18n="common/nav_contact" i18n-target="title">
                        <i class="iconfont iconcontacts"></i>
                    </div>
                </c:if>
                <div class="icon" data-trigger="appcenter" data-i18n="common/nav_appcenter" i18n-target="title">
                    <i class="iconfont iconmore"></i>
                </div>
                <div role="toLunkr" class="icon j-lunkr lunkr" data-i18n="common/nav_lunkr" i18n-target="title">
                    <i class="iconfont iconlunkrlogo"></i>
                    <span></span>
                </div>
            </div>
            <div class="icon icon-help j-to-helpcenter" data-i18n="common/nav_help" i18n-target="title">
                <i class="iconfont iconhelp"></i>
            </div>
            <div class="icon icon-bottom" data-trigger="setting" role="toggle" data-i18n="common/nav_setting" i18n-target="title">
                <i class="iconfont iconsetupcenter"></i>
            </div>
        </aside>
        <article class="lymain">
            <section>
                <header class="lyheader">
                    <div class="logo">
                        <a href="javascript:void(0);" class="u-img j-lylogo" data-trigger="mail.welcome">
                            <img src="" alt="logo" />
                        </a>
                    </div>
                    <ul class="u-list u-list-horizontal">
                        <li><a href="#" class="skin-primary-hover-color f-dn lunkr-bandage f-pr" data-i18n="main.LunkrMobile" data-trigger="lunkrMobile"></a></li>
                        <li><a class="skin-primary-hover-color f-dn f-pr" href="jsp/lunkrsso.jsp?sid=${ajc.sid}" target="_blank" data-i18n="main.Lunkr"></a></li>
                        <li><a href="#" class="skin-primary-hover-color f-dn j-migrate-mbox" data-i18n="main.Migrate" data-trigger="migrate"></a></li>
                        <%-- CM-20951 Mac Config (OS X) --%>
                        <c:if test="${fn:containsIgnoreCase(header['User-Agent'], 'Macintosh')}">
                            <aj:exec func="mobileConfigKeys" key="imap,calDav,cardDav,ldap" var="mobileConfigKeys"/>
                            <c:if test="${!empty mobileConfigKeys}">
                                <li><a href="javascript:void(0)"  class="skin-primary-hover-color"
                                       data-i18n="main.MacConfig" data-trigger="mobileconfig">Mac Config</a></li>
                            </c:if>
                        </c:if>
                        <li class="novice-guide j-novice-guide f-dn"><a href="#" data-trigger="noviceGuide" data-i18n="main.noviceGuide"></a>
                            <div class="novice-guide-box f-dn">
                                <div class="novice-guide-line"></div>
                                <div class="novice-guide-button">
                                    <div class="novice-guide-msg" data-i18n="main.noviceGuideMsg"></div>
                                </div>
                            </div>
                        </li>
                        <c:if test="${ajc.EAP}">
                            <li><a href="../changefaces.jsp?sid=${ajc.sid}&face=XT3&locale=${ajc.locale}"  class="skin-primary-hover-color">XT3</a></li>
                        </c:if>
                        <%--<li><a href="#" data-i18n="main.first_page" data-trigger="mail.welcome"></a></li>--%>
                        <c:if test="${ajc.app.maillistSupportEntrustManager}">
                            <aj:exec func="user:listEntrustMaillist"/>
                            <c:set var="maillistCount" value="${ajc.result.var.total}"/>
                            <c:if test="${maillistCount > 0}">
                                <li><a href="#" data-i18n="main.Maillist" data-trigger="mail.entrustmanager"></a></li>
                            </c:if>
                        </c:if>
                        <c:if test="${ajc.user.enableSwitchWebmailWebadmin}">
                            <li><a href="/webadmin/~${ajc.sid}/~/main/index.jsp?toSystem=webadm" data-i18n="main.ManageWebadmin" target="_self"></a></li>
                        </c:if>
                        <li><a href="#" class="skin-primary-hover-color" data-i18n="main.LockScreen" data-trigger="screenlock"></a></li>
                        <li><a href="#" class="skin-primary-hover-color" data-i18n="main.Logout" data-trigger="logout"></a></li>
                        <%--<li class="header-divider">
                            <a href="javascript:void(0);" class="skin-primary-hover-color history-notification-trigger j-history-notification-trigger">
                                <i class="iconfont iconms"></i>
                            </a>
                        </li>--%>
                        <li>
                            <div class="u-input-control">
                                <span class="u-input-container">
                                    <fmt:message key="${ajc.user.supportFulltextSearch ? 'mail_fulltext_search' : 'mail_search'}" var="searchHint" />
                                    <input type="text" id="lyfullsearch" maxlength="50" disabledhotkey="true"
                                           placeholder="${searchHint}">
                                </span>
                                <span class="j-search iconfont iconsreachm"></span>
                            </div>
                        </li>
                    </ul>
                </header>
                <div class="lybg">
                    <div class="bg1"></div>
                    <div class="bg2"></div>
                    <div class="bg3"></div>
                    <div class="bg4"></div>
                    <div class="bg5"></div>
                </div>
                <div class="lycontent j-layout-content"></div>
            </section>
        </article>
    </section>

    <jsp:include page="jsp/config.jsp" flush="true"/>

    <%@ include file="/bundle/XT5_entry.jspf" %>
</body>
</html>
