;;; lsp-ols.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Sam Precious
;;
;; Author: Sam Precious <samwdp@gmail.com>
;; Keywords:
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; lsp-ols client
;;
;;; Code:

(require 'lsp-mode)

(defgroup lsp-ols nil
  "LSP support for Nim, using nimlsp."
  :group 'lsp-mode
  :link '(url-link "https://github.com/DanielGavin/ols"))

(defcustom lsp-ols-executable-location "c:/tools/ols/ols.exe"
  "Path to `ols' executable"
  :type 'string
  :group 'lsp-ols)

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection lsp-ols-executable-location)
                  :major-modes '(odin-mode)
                  :activation-fn (lsp-activate-on "odin")
                  :server-id 'ols
                  :multi-root t))

(provide 'lsp-ols)
;;; lsp-ols.el ends here
