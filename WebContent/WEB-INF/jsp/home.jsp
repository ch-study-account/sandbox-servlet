<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="module" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="content" class="jp.ac.o_hara.site.ContentBean" scope="request" />
<jsp:useBean id="user" class="jp.ac.o_hara.site.user.UserBean" scope="session" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<module:User />
<jsp:include page="${ content.getContent() }" />
<% if(!user.isAuth()){ %>
<form action="./user" method="post">
<p>ログインしていません</p>
<p>ユーザーID<input type="text" name="userId" value="未入力" />
<p>パスワード<input type="text" name="userPass" value="" /></p>
<input type="submit" name="login" value="ログイン" />
</form>
<p><a href="./user?register">［新規登録］</a></p>
<% }else{ %>
<p>ようこそ、${user.getRealName() }さん</p>
<form action="./user" method="post">
<input type="submit" name="logout" value="ログアウト" />
</form>
<% } %>
</body>
</html>