<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Emraay Bank - Customer Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="dashboard-page">
    <div class="dashboard-container">
        <!-- Header -->
        <header class="dashboard-header">
            <div class="header-left">
                <div class="logo">
                    <h1>🏦 Emraay Bank</h1>
                </div>
            </div>
            <div class="header-right">
                <div class="user-info">
                    <span class="welcome-text">Welcome, ${customer.firstName}!</span>
                    <div class="user-avatar">${customer.firstName.charAt(0)}${customer.lastName.charAt(0)}</div>
                </div>
                <a href="login" class="logout-btn">Logout</a>
            </div>
        </header>

        <!-- Main Content -->
        <main class="dashboard-main">
            <!-- Account Summary -->
            <section class="account-summary">
                <div class="summary-card">
                    <div class="summary-header">
                        <h2>Account Summary</h2>
                        <span class="account-number">Account: ${customer.accountNumber}</span>
                    </div>
                    <div class="balance-display">
                        <div class="balance-label">Current Balance</div>
                        <div class="balance-amount">
                            <fmt:formatNumber value="${customer.accountBalance}" type="currency" currencyCode="CAD"/>
                        </div>
                    </div>
                    <div class="account-details">
                        <div class="detail-item">
                            <span class="detail-label">Account Holder:</span>
                            <span class="detail-value">${customer.fullName}</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Email:</span>
                            <span class="detail-value">${customer.email}</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Phone:</span>
                            <span class="detail-value">${customer.phoneNumber}</span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Quick Actions -->
            <section class="quick-actions">
                <h3>Quick Actions</h3>
                <div class="actions-grid">
                    <button class="action-btn">
                        <span class="action-icon">💸</span>
                        <span class="action-text">Transfer Money</span>
                    </button>
                    <button class="action-btn">
                        <span class="action-icon">📱</span>
                        <span class="action-text">Pay Bills</span>
                    </button>
                    <button class="action-btn">
                        <span class="action-icon">📊</span>
                        <span class="action-text">View Statements</span>
                    </button>
                    <button class="action-btn">
                        <span class="action-icon">⚙️</span>
                        <span class="action-text">Account Settings</span>
                    </button>
                </div>
            </section>

            <!-- Recent Transactions -->
            <section class="recent-transactions">
                <div class="transactions-header">
                    <h3>Recent Transactions</h3>
                    <a href="#" class="view-all-link">View All</a>
                </div>
                <div class="transactions-list">
                    <c:forEach var="transaction" items="${transactions}" begin="0" end="5">
                        <div class="transaction-item">
                            <div class="transaction-icon">
                                <c:choose>
                                    <c:when test="${transaction.transactionType == 'CREDIT'}">
                                        <span class="icon-credit">📈</span>
                                    </c:when>
                                    <c:when test="${transaction.transactionType == 'DEBIT'}">
                                        <span class="icon-debit">📉</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="icon-transfer">🔄</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="transaction-details">
                                <div class="transaction-description">${transaction.description}</div>
                                <div class="transaction-date">${transaction.formattedDate}</div>
                            </div>
                            <div class="transaction-amount">
                                <c:choose>
                                    <c:when test="${transaction.transactionType == 'CREDIT'}">
                                        <span class="amount-positive">+<fmt:formatNumber value="${transaction.amount}" type="currency" currencyCode="CAD"/></span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="amount-negative">-<fmt:formatNumber value="${transaction.amount}" type="currency" currencyCode="CAD"/></span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="transaction-status">
                                <span class="status-badge status-${transaction.status.toLowerCase()}">${transaction.status}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>

            <!-- Account Statistics -->
            <section class="account-stats">
                <h3>Account Statistics</h3>
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon">💰</div>
                        <div class="stat-content">
                            <div class="stat-value">6</div>
                            <div class="stat-label">Transactions This Month</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">📊</div>
                        <div class="stat-content">
                            <div class="stat-value">$2,525.50</div>
                            <div class="stat-label">Total Deposits</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">💳</div>
                        <div class="stat-content">
                            <div class="stat-value">$525.50</div>
                            <div class="stat-label">Total Withdrawals</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">📈</div>
                        <div class="stat-content">
                            <div class="stat-value">$25.50</div>
                            <div class="stat-label">Interest Earned</div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer class="dashboard-footer">
            <div class="footer-content">
                <p>&copy; 2024 Emraay Bank. All rights reserved.</p>
                <div class="footer-links">
                    <a href="#">Privacy Policy</a>
                    <a href="#">Terms of Service</a>
                    <a href="#">Contact Support</a>
                </div>
            </div>
        </footer>
    </div>

    <script src="js/dashboard.js"></script>
</body>
</html>
