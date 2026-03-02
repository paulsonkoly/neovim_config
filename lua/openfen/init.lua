local function open_fen_on_lichess()
  local bufnr = 0

  local start = vim.fn.getpos("v")
  local finish = vim.fn.getpos(".")

  local start_row, start_col = start[2], start[3]
  local end_row, end_col = finish[2], finish[3]

  if start_row ~= end_row then
    print("multi-line selection")
    return
  end

  if start_col > end_col then
    start_col, end_col = end_col, start_col
  end

  local fen = vim.api.nvim_buf_get_text(bufnr, start_row-1, start_col-1, end_row-1, end_col, {})

  -- Split FEN
  local parts = vim.split(fen[1], " ")
  if #parts < 6 then
    print("Invalid FEN")
    return
  end

  local board = parts[1]
  local turn = parts[2]
  local castling = parts[3]
  local ep = parts[4]
  local halfmove = parts[5]
  local fullmove = parts[6]

  -- local color = (turn == "w") and "white" or "black"
  local color = "white"

  local url = string.format(
    "https://lichess.org/editor/%s_%s_%s_%s_%s_%s?color=%s",
    board, turn, castling, ep, halfmove, fullmove, color
  )

  vim.fn["netrw#BrowseX"](url, 0)
end

-- Create a visual mode mapping
vim.keymap.set("v", "gf", open_fen_on_lichess, { silent = true })
