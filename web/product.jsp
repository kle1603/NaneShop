<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Smaller</title>

        <!-- Embed Reset -->
        <link rel="stylesheet" href="./assets/css/reset.css" />

        <!-- Embed Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Ysabeau+Infant:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
        />

        <!-- Embed Css -->
        <link rel="stylesheet" href="./assets/css/main.css" />
    </head>
    <body>
        <c:import url="./header.jsp" />
        <!-- Main -->

        <main>
            <div
                class="popup__background ${requestScope.ADD_ITEM_SUCCESS ? 'popup__active' : 'popup__hidden'}"
            >
                <div class="popup__content">
                    <div class="popup__image">
                        <img
                            src="./assets/img/check.svg"
                            alt=""
                            class="popup__img"
                        />
                    </div>
                    <div class="popup__body">
                        <h3 class="popup__heading">Successfully applied!</h3>
                        <p class="popup__desc">Product is in your cart</p>
                    </div>
                </div>
            </div>
            <div class="product">
                <div class="container">
                    <div class="product__inner">
                        <h2 class="product__heading">Shop All Products</h2>

                        <div class="product__option">
                            <div class="product__search">
                                <form
                                    class="product__search-form"
                                    action="MainController"
                                    method="GET"
                                >
                                    <input
                                        class="product__search-text"
                                        type="text"
                                        name="search"
                                        placeholder="Search"
                                        value="${param.search}"
                                    />
                                    <input
                                        type="hidden"
                                        name="action"
                                        value="Product"
                                    />
                                    <button
                                        class="product__search-submit"
                                        type="submit"
                                    >
                                        <img
                                            class="product__search-image"
                                            src="./assets/img/Search.jpg"
                                            alt=""
                                        />
                                    </button>
                                </form>
                            </div>
                            <div class="product__filter">
                                <figure class="product__filter-img">
                                    <img
                                        src="./assets/img/Menu-2.jpg"
                                        class="product__filter-img_menu"
                                        alt=""
                                    />
                                </figure>
                                <p class="product__filter-content">
                                    All Filters
                                </p>
                            </div>
                        </div>
                        <div class="product__list">
                            <!-- Item 1 -->
                            <c:if test="${not empty requestScope.PRODUCT_LIST}">
                                <c:forEach
                                    var="product"
                                    items="${requestScope.PRODUCT_LIST}"
                                >
                                    <div class="product__item">
                                        <figure
                                            class="product__item-img-wrapper"
                                        >
                                            <a href="#!">
                                                <img
                                                    class="product__item-img"
                                                    src="${product.imageURL}"
                                                    alt=""
                                                />
                                            </a>

                                            <c:url
                                                var="cartUrl"
                                                value="MainController"
                                            >
                                                <c:param
                                                    name="action"
                                                    value="AddToCart"
                                                />
                                                <c:param
                                                    name="productId"
                                                    value="${product.productId}"
                                                />
                                                <c:param
                                                    name="search"
                                                    value="${param.search}"
                                                />
                                                <c:param
                                                    name="page"
                                                    value="${requestScope.page}"
                                                />
                                            </c:url>
                                            <c:url
                                                var="loginUrl"
                                                value="login.jsp"
                                            />
                                            <a
                                                href="${empty LOGIN ? loginUrl : cartUrl}"
                                                class="product__item-img-title"
                                            >
                                                Add to Cart
                                            </a>
                                        </figure>
                                        <section class="product__item-content">
                                            <div class="row">
                                                <a
                                                    href="#!"
                                                    class="product__item-category"
                                                >
                                                    ${product.category.categoryName}
                                                </a>
                                                <img
                                                    class="product__item-heart"
                                                    src="./assets/img/heart.svg"
                                                    alt=""
                                                />
                                            </div>

                                            <a
                                                href="#!"
                                                class="product__item-title line-clamp"
                                            >
                                                ${product.productName}
                                            </a>

                                            <div class="row">
                                                <div class="product__item-rate">
                                                    <img
                                                        src="./assets/icons/star.svg"
                                                        alt=""
                                                        class="product__item-star"
                                                    />
                                                    <p
                                                        class="product__item-rating"
                                                    >
                                                        5.0 (18)
                                                    </p>
                                                </div>
                                                <strong
                                                    class="product__item-price"
                                                    >$${product.price}</strong
                                                >
                                            </div>
                                        </section>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                        <!-- <button class="btn--secondary product__btn">
                                Load More
                            </button> -->
                        <c:if
                            test="${requestScope.TOTAL_PRODUCT > requestScope.PRODUCTS_PER_PAGE}"
                        >
                            <div class="pagination">
                                <c:if test="${requestScope.page > 1}">
                                    <c:url
                                        var="prevpaging"
                                        value="MainController"
                                    >
                                        <c:param
                                            name="action"
                                            value="Product"
                                        />
                                        <c:param
                                            name="page"
                                            value="${requestScope.page - 1 }"
                                        />
                                        <c:if test="${param.search != null}">
                                            <c:param
                                                name="search"
                                                value="${param.search}"
                                            />
                                        </c:if>
                                    </c:url>
                                    <div class="step">
                                        <a
                                            class="pagenum pagenum-left"
                                            href="${prevPaging}"
                                        >
                                            <svg
                                                class="arrow-left"
                                                width="16"
                                                height="16"
                                                viewBox="0 0 16 16"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <path
                                                    d="M6 3L11 8L6 13"
                                                    stroke="currentColor"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                />
                                            </svg>
                                            <p>Previous</p>
                                        </a>
                                    </div>
                                </c:if>

                                <c:forEach
                                    var="pageNum"
                                    begin="1"
                                    end="${(requestScope.TOTAL_PRODUCT - 1) / requestScope.PRODUCTS_PER_PAGE + 1}"
                                >
                                    <c:choose>
                                        <c:when
                                            test="${pageNum == requestScope.page}"
                                        >
                                            <p
                                                class="pagenum pagenum-num pagenum-active"
                                            >
                                                ${pageNum}
                                            </p>
                                        </c:when>
                                        <c:otherwise>
                                            <c:url
                                                var="paging"
                                                value="MainController"
                                            >
                                                <c:param
                                                    name="action"
                                                    value="Product"
                                                />
                                                <c:param
                                                    name="page"
                                                    value="${pageNum}"
                                                />
                                                <c:if
                                                    test="${param.search != null}"
                                                >
                                                    <c:param
                                                        name="search"
                                                        value="${param.search}"
                                                    />
                                                </c:if>
                                            </c:url>
                                            <a
                                                class="pagenum pagenum-num"
                                                href="${paging}"
                                                >${pageNum}</a
                                            >
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:if
                                    test="${requestScope.page < Math.ceil(requestScope.TOTAL_PRODUCT / requestScope.PRODUCTS_PER_PAGE)}"
                                >
                                    <c:url
                                        var="nextPaging"
                                        value="MainController"
                                    >
                                        <c:param
                                            name="action"
                                            value="Product"
                                        />
                                        <c:param
                                            name="page"
                                            value="${requestScope.page + 1}"
                                        />
                                        <c:if test="${param.search != null}">
                                            <c:param
                                                name="search"
                                                value="${param.search}"
                                            />
                                        </c:if>
                                    </c:url>
                                    <div class="step">
                                        <a
                                            class="pagenum pagenum-right"
                                            href="${nextPaging}"
                                        >
                                            <p>Next</p>
                                            <svg
                                                class="arrow-right"
                                                width="16"
                                                height="16"
                                                viewBox="0 0 16 16"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <path
                                                    d="M6 3L11 8L6 13"
                                                    stroke="currentColor"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                />
                                            </svg>
                                        </a>
                                    </div>
                                </c:if>
                            </div>
                        </c:if>
                        <c:if test="${empty PRODUCT_LIST}">
                            <p>No products found.</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </main>
        <c:import url="./footer.jsp" />

        <script>
            setTimeout(function () {
                var popup = document.querySelector(".popup__active");
                if (popup) {
                    popup.classList.replace("popup__active", "popup__hidden");
                }
            }, 1000);
        </script>
    </body>
</html>
