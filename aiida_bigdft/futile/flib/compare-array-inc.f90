    character(len = *), intent(in), optional :: label

    if (f_err_raise(size(val) /= size(expected), "size mismatch")) return
    if (any(val /= expected)) then
       if (present(label)) then
          call f_err_throw(label // ": maximum difference of " // yaml_toa(maxval(abs(val - expected))))
       else
          call f_err_throw("maximum difference of " // yaml_toa(maxval(abs(val - expected))))
       end if
    end if
