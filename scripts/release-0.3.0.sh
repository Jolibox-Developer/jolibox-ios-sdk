#!/usr/bin/env bash
set -euo pipefail

tag="0.3.0"
assets_dir="${1:?Usage: scripts/release-0.3.0.sh <assets-dir>}"
commit="$(git rev-parse HEAD)"
remote_main="$(git ls-remote origin refs/heads/main | awk '{print $1}')"

[[ -n "${remote_main}" ]] || { echo "origin/main does not exist; push the release commit first" >&2; exit 1; }
[[ "${remote_main}" == "${commit}" ]] || { echo "HEAD must match origin/main before creating the release" >&2; exit 1; }

expected=(
  "Jolibox-0.3.0.xcframework.zip 6400f808d5de19c62c37df6495f63261863191a8bb674870733d9bc7348f2e29"
  "IGListDiffKit-5.1.0.xcframework.zip 940b2ea3a2c305d2127ab1058779c159814db6cc033faf8d1f1b69969cb796a4"
  "IGListKit-5.1.0.xcframework.zip 1e7cee7a8919afc3417bb0a2d811ffd92c024aff8a9568e42cca3faa3bc13306"
  "IGListSwiftKit-5.1.0.xcframework.zip faf3557d529d68f671d5d82fde9c71195a5272f6bd93cf85c69f762d1480a982"
)

for item in "${expected[@]}"; do
  read -r name checksum <<<"${item}"
  actual="$(shasum -a 256 "${assets_dir}/${name}" | awk '{print $1}')"
  [[ "${actual}" == "${checksum}" ]] || { echo "Checksum mismatch: ${name}" >&2; exit 1; }
done

gh release create "${tag}" "${assets_dir}"/*.zip --target "${commit}" --title "${tag}" --generate-notes
