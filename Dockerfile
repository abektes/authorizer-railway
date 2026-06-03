# Authorizer on Railway — pinned to 2.0.0, only flags this version supports.
FROM lakhansamani/authorizer:2.0.0
# Neutralize the base image entrypoint so our CMD runs through a shell and env vars expand.
ENTRYPOINT ["/bin/sh", "-c"]
# Single-string exec-form CMD: the whole invocation is one arg to `sh -c`, so flags reach the binary.
CMD ["exec ./authorizer --database-type=\"${DATABASE_TYPE:-postgres}\" --database-url=\"${DATABASE_URL}\" --client-id=\"${CLIENT_ID}\" --client-secret=\"${CLIENT_SECRET}\" --admin-secret=\"${ADMIN_SECRET}\" --redis-url=\"${REDIS_URL}\" --jwt-type=\"${JWT_TYPE:-HS256}\" --jwt-secret=\"${JWT_SECRET}\" --env=\"${ENV:-production}\" --host=\"0.0.0.0\" --http-port=\"${PORT:-8080}\" --enable-basic-authentication=\"true\" --enable-magic-link-login=\"true\" --disable-admin-header-auth=\"true\""]
