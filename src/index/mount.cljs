(ns ^:dev/once index.mount
 (:require
  [hoplon.core :as h]
  [javelin.core :as j]
  [hoplon.jquery]
  syntax-highlighter.hoplon))

(defn to-element! [el]
 (el
  (syntax-highlighter.hoplon/stylesheet)))

(let [mountpoint (atom (h/div))]
 (defn remount! []
  ; clear out hoplon data from mountpoint div
  (h/hl! @mountpoint :hoplon/reset nil)
  ; create a new div for mountpoint
  (reset! mountpoint (h/div))
  ; flush the DOM in the document body
  (set! (.-innerHTML (h/body)) "")
  ; drop the new mountpoint into the body
  (h/html
   [
    (h/head)
    (h/body
     @mountpoint)])
  ; rebuild everything
  (to-element! @mountpoint)))

; hook into shadow cljs
(defn ^:dev/after-load start! []
 (remount!))
(start!)
