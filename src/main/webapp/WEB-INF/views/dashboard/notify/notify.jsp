<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
  <head>
    <!-- toastr css 라이브러리 -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="/resource/css/dashboard/notify/toast.min.css"
    />

    <link
      rel="stylesheet"
      type="text/css"
      href="/resource/css/dashboard/notify/notify.css"
    />
  </head>
  <div id="dashboard_notify">
    <div class="container-fluid text-center">
      <div
        id="toast-container"
        class="toast-container fix-position"
        aria-live="polite"
        aria-atomic="true"
      >
        <div
          id="toast-1"
          class="toast fade show"
          role="alert"
          aria-live="assertive"
          aria-atomic="true"
          data-autohide="false"
        >
          <div class="toast-header bg-danger text-white">
            <strong class="mr-auto">기본 서류를 등록해주세요.</strong
            ><button
              type="button"
              class="ml-2 mb-1 close"
              data-dismiss="toast"
              aria-label="Close"
            >
              <span aria-hidden="true" class="text-white">×</span>
            </button>
          </div>
        </div>
        <div
          id="toast-2"
          class="toast fade show"
          role="alert"
          aria-live="assertive"
          aria-atomic="true"
          data-autohide="false"
        >
          <div class="toast-header bg-danger text-white">
            <strong class="mr-auto">스킬 및 경력 작성을 해주세요.</strong
            ><button
              type="button"
              class="ml-2 mb-1 close"
              data-dismiss="toast"
              aria-label="Close"
            >
              <span aria-hidden="true" class="text-white">×</span>
            </button>
          </div>
        </div>
        <div
          id="toast-3"
          class="toast fade show"
          role="alert"
          aria-live="assertive"
          aria-atomic="true"
          data-autohide="false"
        >
          <div class="toast-header bg-danger text-white">
            <strong class="mr-auto">Test</strong
            ><small class="text-white">11 mins ago</small
            ><button
              type="button"
              class="ml-2 mb-1 close"
              data-dismiss="toast"
              aria-label="Close"
            >
              <span aria-hidden="true" class="text-white">×</span>
            </button>
          </div>
          <div class="toast-body">결제를 요청합니다.</div>
        </div>
        <div
          id="toast-5"
          class="toast fade show"
          role="alert"
          aria-live="assertive"
          aria-atomic="true"
          data-autohide="false"
        >
          <div class="toast-header bg-info text-white">
            <strong class="mr-auto"
              >Hello, world! This is a toast message.</strong
            ><button
              type="button"
              class="ml-2 mb-1 close"
              data-dismiss="toast"
              aria-label="Close"
            >
              <span aria-hidden="true" class="text-white">×</span>
            </button>
          </div>
        </div>
        <div
          id="toast-6"
          class="toast fade show"
          role="alert"
          aria-live="assertive"
          aria-atomic="true"
          data-autohide="false"
        >
          <div class="toast-header bg-success text-white">
            <strong class="mr-auto">Awesome!</strong
            ><small class="text-white">11 mins ago</small
            ><button
              type="button"
              class="ml-2 mb-1 close"
              data-dismiss="toast"
              aria-label="Close"
            >
              <span aria-hidden="true" class="text-white">×</span>
            </button>
          </div>
          <div class="toast-body">The action has been completed.</div>
        </div>
      </div>

      <!-- <button class="snack btn btn-primary">Snack</button>
      <button class="toast-btn btn btn-primary">Toast</button> -->
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- toastr js 라이브러리 -->
    <script
      type="text/javascript"
      src="/resource/js/dashboard/notify/toast.min.js"
    ></script>

    <script
      type="text/javascript"
      src="/resource/js/dashboard/notify/notify.js"
    ></script>
  </div>
</html>
